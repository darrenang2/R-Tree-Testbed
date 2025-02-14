// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xkrnl.h"

extern XKrnl_Config XKrnl_ConfigTable[];

XKrnl_Config *XKrnl_LookupConfig(u16 DeviceId) {
	XKrnl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKRNL_NUM_INSTANCES; Index++) {
		if (XKrnl_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKrnl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKrnl_Initialize(XKrnl *InstancePtr, u16 DeviceId) {
	XKrnl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKrnl_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKrnl_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

