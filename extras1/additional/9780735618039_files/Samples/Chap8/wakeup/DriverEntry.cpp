// Main program for wakeup driver
// Copyright (C) 2001 by Walter Oney
// All rights reserved

#include "stddcls.h"
#include "driver.h"

NTSTATUS AddDevice(IN PDRIVER_OBJECT DriverObject, IN PDEVICE_OBJECT pdo);
VOID DriverUnload(IN PDRIVER_OBJECT DriverObject);

struct INIT_STRUCT : public _GENERIC_INIT_STRUCT {
//	QSIO morequeues[1];			// additional devqueue/sio pointers
	};

BOOLEAN win98 = FALSE;

UNICODE_STRING servkey;

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

extern "C" NTSTATUS DriverEntry(IN PDRIVER_OBJECT DriverObject,
	IN PUNICODE_STRING RegistryPath)
	{							// DriverEntry
	KdPrint((DRIVERNAME " - Entering DriverEntry: DriverObject %8.8lX\n", DriverObject));

	// Insist that OS support at least the WDM level of the DDK we use

	if (!IoIsWdmVersionAvailable(1, 0))
		{
		KdPrint((DRIVERNAME " - Expected version of WDM (%d.%2.2d) not available\n", 1, 0));
		return STATUS_UNSUCCESSFUL;
		}

	// We require GENERIC.SYS 2.0 or later. If a version earlier than 1.3 is installed,
	// GenericGetVersion won't be exported, and this driver won't load in the first place.
	// Too bad I didn't think of including this function at the beginning!

	if (GenericGetVersion() < 0x00020000)
		{
		KdPrint((DRIVERNAME " - Required version (2.0) of GENERIC.SYS not installed\n"));
		return STATUS_UNSUCCESSFUL;
		}

	// See if we're running under Win98 or NT:

	win98 = IsWin98();

#if DBG
	if (win98)
		KdPrint((DRIVERNAME " - Running under Windows 98\n"));
	else
		KdPrint((DRIVERNAME " - Running under NT\n"));
#endif

	// Save the name of the service key

	servkey.Buffer = (PWSTR) ExAllocatePool(PagedPool, RegistryPath->Length + sizeof(WCHAR));
	if (!servkey.Buffer)
		{
		KdPrint((DRIVERNAME " - Unable to allocate %d bytes for copy of service key name\n", RegistryPath->Length + sizeof(WCHAR)));
		return STATUS_INSUFFICIENT_RESOURCES;
		}
	servkey.MaximumLength = RegistryPath->Length + sizeof(WCHAR);
	RtlCopyUnicodeString(&servkey, RegistryPath);
	servkey.Buffer[RegistryPath->Length / 2] = 0;	// add a null terminator

	// Initialize function pointers

	DriverObject->DriverUnload = DriverUnload;
	DriverObject->DriverExtension->AddDevice = AddDevice;

	DriverObject->MajorFunction[IRP_MJ_POWER] = DispatchPower;
	DriverObject->MajorFunction[IRP_MJ_SYSTEM_CONTROL] = DispatchWmi;
	DriverObject->MajorFunction[IRP_MJ_PNP] = DispatchPnp;
	
	return STATUS_SUCCESS;
	}							// DriverEntry

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID DriverUnload(IN PDRIVER_OBJECT DriverObject)
	{							// DriverUnload
	PAGED_CODE();
	KdPrint((DRIVERNAME " - Entering DriverUnload: DriverObject %8.8lX\n", DriverObject));
	RtlFreeUnicodeString(&servkey);
	}							// DriverUnload

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS AddDevice(IN PDRIVER_OBJECT DriverObject, IN PDEVICE_OBJECT pdo)
	{							// AddDevice
	PAGED_CODE();
	KdPrint((DRIVERNAME " - Entering AddDevice: DriverObject %8.8lX, pdo %8.8lX\n", DriverObject, pdo));

	NTSTATUS status;

	// Create a function device object to represent the hardware we're managing.

	PDEVICE_OBJECT fdo;

	ULONG dxsize = (sizeof(DEVICE_EXTENSION) + 7) & ~7;
	ULONG xsize = dxsize + GetSizeofGenericExtension();
	
	UNICODE_STRING devname;
	WCHAR namebuf[32];
	static LONG devcount = -1;
	_snwprintf(namebuf, arraysize(namebuf), L"\\Device\\WAKEUP_%d", InterlockedIncrement(&devcount));
	RtlInitUnicodeString(&devname, namebuf);

	status = IoCreateDevice(DriverObject, xsize, &devname,
		FILE_DEVICE_UNKNOWN, FILE_DEVICE_SECURE_OPEN, FALSE, &fdo);
	if (!NT_SUCCESS(status))
		{						// can't create device object
		KdPrint((DRIVERNAME " - IoCreateDevice failed - %X\n", status));
		return status;
		}						// can't create device object
	
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	BOOLEAN ginit = FALSE;

	// From this point forward, any error will have side effects that need to
	// be cleaned up. Using a do-once block allows us to modify the program
	// easily without losing track of the side effects.

	do
		{						// finish initialization
		pdx->DeviceObject = fdo;
		pdx->Pdo = pdo;

		ExInitializeFastMutex(&pdx->SuspendMutex);

		// Make a copy of the device name

		pdx->devname.Buffer = (PWCHAR) ExAllocatePool(NonPagedPool, devname.MaximumLength);
		if (!pdx->devname.Buffer)
			{					// can't allocate buffer
			status = STATUS_INSUFFICIENT_RESOURCES;
			KdPrint((DRIVERNAME " - Unable to allocate %d bytes for copy of name\n", devname.MaximumLength));
			break;
			}					// can't allocate buffer
		pdx->devname.MaximumLength = devname.MaximumLength;
		RtlCopyUnicodeString(&pdx->devname, &devname);

		// Link our device object into the stack leading to the PDO
		
		pdx->LowerDeviceObject = IoAttachDeviceToDeviceStack(fdo, pdo);
		if (!pdx->LowerDeviceObject)
			{						// can't attach device
			KdPrint((DRIVERNAME " - IoAttachDeviceToDeviceStack failed\n"));
			status = STATUS_DEVICE_REMOVED;
			break;
			}						// can't attach device

		// Get wakeup enable/disable flag from registry. We won't actually use this value
		// until StartDevice time.

		HANDLE hkey;
		status = IoOpenDeviceRegistryKey(pdo, PLUGPLAY_REGKEY_DEVICE, KEY_QUERY_VALUE, &hkey);
		if (!NT_SUCCESS(status))
			{
			KdPrint((DRIVERNAME " - IoOpenDeviceRegistryKey failed - %X\n", status));
			break;
			}

		UNICODE_STRING valname;
		RtlInitUnicodeString(&valname, L"DeviceWakeEnable");

		// Note that DeviceWakeEnable is sizeof(ULONG) in length and that
		// the standard DDK KEY_VALUE_PARTIAL_INFORMATION structure will be padded
		// to that length by virtue of its imbedded ULONG members. Thus, Data[] is
		// going to have 4 bytes reserved for it.

		KEY_VALUE_PARTIAL_INFORMATION value;
		ULONG junk;

		status = ZwQueryValueKey(hkey, &valname, KeyValuePartialInformation, &value,
			sizeof(value), &junk);

		if (!NT_SUCCESS(status))
			pdx->wakeup = TRUE;		// default to TRUE if nothing else ever saved
		else
			pdx->wakeup = (BOOLEAN) *(PULONG) value.Data;

		// Fetch the DeviceEnable flag from the registry, which indicates whether we're
		// supposed to automatically power down when not in use.

		RtlInitUnicodeString(&valname, L"DeviceEnable");
		status = ZwQueryValueKey(hkey, &valname, KeyValuePartialInformation, &value,
			sizeof(value), &junk);
		if (!NT_SUCCESS(status))
			pdx->autopower = FALSE;	// default to FALSE if never told otherwise
		else
			pdx->autopower = (BOOLEAN) *(PULONG) value.Data;

		ZwClose(hkey);

		// Set power management flags in the device object

		fdo->Flags |= DO_POWER_PAGABLE;

		// Initialize to use the GENERIC.SYS library. Unlike other samples in the book,
		// this driver needs RestoreDeviceContext and GetDevicePowerState functions

		pdx->pgx = (PGENERIC_EXTENSION) ((PUCHAR) pdx + dxsize);

		INIT_STRUCT gis;
		RtlZeroMemory(&gis, sizeof(gis));
		gis.Size = sizeof(gis);
		gis.DeviceObject = fdo;
		gis.Pdo = pdo;
		gis.Ldo = pdx->LowerDeviceObject;
		gis.RemoveLock = &pdx->RemoveLock;
		gis.StartDevice = StartDevice;
		gis.StopDevice = StopDevice;
		gis.RemoveDevice = RemoveDevice;
		gis.RestoreDeviceContext = RestoreDeviceContext;
		gis.GetDevicePowerState = GetDevicePowerState;
		RtlInitUnicodeString(&gis.DebugName, LDRIVERNAME);
		gis.Flags = GENERIC_SURPRISE_REMOVAL_OK;

		status = InitializeGenericExtension(pdx->pgx, &gis);
		if (!NT_SUCCESS(status))
			{
			KdPrint((DRIVERNAME " - InitializeGenericExtension failed - %X\n", status));
			break;
			}
		ginit = TRUE;

		// Clear the "initializing" flag so that we can get IRPs

		fdo->Flags &= ~DO_DEVICE_INITIALIZING;

		// Register our willingness to handle WMI requests after we're ready to handle IRPs

		WmiInitialize(fdo);
		}						// finish initialization
	while (FALSE);

	if (!NT_SUCCESS(status))
		{					// need to cleanup
		if (ginit)
			CleanupGenericExtension(pdx->pgx);
		if (pdx->devname.Buffer)
			RtlFreeUnicodeString(&pdx->devname);
		if (pdx->LowerDeviceObject)
			IoDetachDevice(pdx->LowerDeviceObject);
		IoDeleteDevice(fdo);
		}					// need to cleanup

	return status;
	}							// AddDevice

///////////////////////////////////////////////////////////////////////////////

#pragma LOCKEDCODE

NTSTATUS CompleteRequest(IN PIRP Irp, IN NTSTATUS status, IN ULONG_PTR info)
	{							// CompleteRequest
	Irp->IoStatus.Status = status;
	Irp->IoStatus.Information = info;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);
	return status;
	}							// CompleteRequest

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchPnp(PDEVICE_OBJECT fdo, PIRP Irp)
	{							// DispatchPnp
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	return GenericDispatchPnp(pdx->pgx, Irp);
	}							// DispatchPnp

NTSTATUS DispatchPower(PDEVICE_OBJECT fdo, PIRP Irp)
	{							// DispatchPower
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	return GenericDispatchPower(pdx->pgx, Irp);
	}							// DispatchPower

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID RemoveDevice(IN PDEVICE_OBJECT fdo)
	{							// RemoveDevice
	PAGED_CODE();
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	NTSTATUS status;

	WmiTerminate(fdo);
	RtlFreeUnicodeString(&pdx->devname);

	if (pdx->LowerDeviceObject)
		IoDetachDevice(pdx->LowerDeviceObject);

	IoDeleteDevice(fdo);
	}							// RemoveDevice

#pragma LOCKEDCODE				// force inline functions into nonpaged code
