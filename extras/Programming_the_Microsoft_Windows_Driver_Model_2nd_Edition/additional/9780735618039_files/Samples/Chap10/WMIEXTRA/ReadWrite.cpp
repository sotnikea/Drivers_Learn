// Read/Write request processors for wmiextra driver
// Copyright (C) 1999 by Walter Oney
// All rights reserved

#include "stddcls.h"
#include "driver.h"

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchCreate(PDEVICE_OBJECT fdo, PIRP Irp)
	{							// DispatchCreate
	PAGED_CODE();
	KdPrint((DRIVERNAME " - "
		"IRP_MJ_CREATE\n"));
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;

	PIO_STACK_LOCATION stack = IoGetCurrentIrpStackLocation(Irp);

	NTSTATUS status = STATUS_SUCCESS;
	return CompleteRequest(Irp, status, 0);
	}							// DispatchCreate

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchClose(PDEVICE_OBJECT fdo, PIRP Irp)
	{							// DispatchClose
	PAGED_CODE();
	KdPrint((DRIVERNAME " - "
		"IRP_MJ_CLOSE\n"));
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	PIO_STACK_LOCATION stack = IoGetCurrentIrpStackLocation(Irp);
	return CompleteRequest(Irp, STATUS_SUCCESS, 0);
	}							// DispatchClose

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS StartDevice(PDEVICE_OBJECT fdo, PCM_PARTIAL_RESOURCE_LIST raw, PCM_PARTIAL_RESOURCE_LIST translated)
	{							// StartDevice
	return STATUS_SUCCESS;
	}							// StartDevice

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID StopDevice(IN PDEVICE_OBJECT fdo, BOOLEAN oktouch /* = FALSE */)
	{							// StopDevice
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	}							// StopDevice
