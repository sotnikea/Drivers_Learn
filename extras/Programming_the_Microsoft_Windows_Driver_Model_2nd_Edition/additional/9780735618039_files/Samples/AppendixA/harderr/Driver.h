// Declarations for harderr driver
// Copyright (C) 1999 by Walter Oney
// All rights reserved

#ifndef DRIVER_H
#define DRIVER_H
#include "generic.h"

#define DRIVERNAME "HARDERR"				// for use in messages
#define LDRIVERNAME L"HARDERR"				// for use in UNICODE string constants

///////////////////////////////////////////////////////////////////////////////
// Device extension structure

typedef struct _DEVICE_EXTENSION {
	PDEVICE_OBJECT DeviceObject;			// device object this extension belongs to
	PDEVICE_OBJECT LowerDeviceObject;		// next lower driver in same stack
	PDEVICE_OBJECT Pdo;						// the PDO
	IO_REMOVE_LOCK RemoveLock;				// removal control locking structure
	UNICODE_STRING ifname;					// interface name
	PGENERIC_EXTENSION pgx;					// device extension for GENERIC.SYS

	// TODO add additional per-device declarations

	} DEVICE_EXTENSION, *PDEVICE_EXTENSION;

///////////////////////////////////////////////////////////////////////////////
// Global functions

VOID RemoveDevice(IN PDEVICE_OBJECT fdo);
NTSTATUS CompleteRequest(IN PIRP Irp, IN NTSTATUS status, IN ULONG_PTR info);
NTSTATUS StartDevice(PDEVICE_OBJECT fdo, PCM_PARTIAL_RESOURCE_LIST raw, PCM_PARTIAL_RESOURCE_LIST translated);
VOID StopDevice(PDEVICE_OBJECT fdo, BOOLEAN oktouch = FALSE);

// I/O request handlers

NTSTATUS DispatchPower(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchPnp(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchWmi(PDEVICE_OBJECT fdo, PIRP Irp);

extern BOOLEAN win98;
extern UNICODE_STRING servkey;

#endif // DRIVER_H
