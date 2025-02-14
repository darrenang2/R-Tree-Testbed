// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_CfgInitialize(XKrnl *InstancePtr, XKrnl_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_Set_HBM_PTR(XKrnl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_HBM_PTR_DATA, (u32)(Data));
    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_HBM_PTR_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_Get_HBM_PTR(XKrnl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_HBM_PTR_DATA);
    Data += (u64)XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_HBM_PTR_DATA + 4) << 32;
    return Data;
}

void XKrnl_Set_operations(XKrnl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_OPERATIONS_DATA, (u32)(Data));
    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_OPERATIONS_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_Get_operations(XKrnl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_OPERATIONS_DATA);
    Data += (u64)XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_OPERATIONS_DATA + 4) << 32;
    return Data;
}

void XKrnl_Set_parameters_for_operations(XKrnl *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_PARAMETERS_FOR_OPERATIONS_DATA, (u32)(Data));
    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_PARAMETERS_FOR_OPERATIONS_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_Get_parameters_for_operations(XKrnl *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_PARAMETERS_FOR_OPERATIONS_DATA);
    Data += (u64)XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_PARAMETERS_FOR_OPERATIONS_DATA + 4) << 32;
    return Data;
}

void XKrnl_Set_number_of_operations(XKrnl *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_NUMBER_OF_OPERATIONS_DATA, Data);
}

u32 XKrnl_Get_number_of_operations(XKrnl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_NUMBER_OF_OPERATIONS_DATA);
    return Data;
}

void XKrnl_Set_board_num(XKrnl *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_BOARD_NUM_DATA, Data);
}

u32 XKrnl_Get_board_num(XKrnl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_BOARD_NUM_DATA);
    return Data;
}

void XKrnl_Set_exe(XKrnl *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_EXE_DATA, Data);
}

u32 XKrnl_Get_exe(XKrnl *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_CONTROL_ADDR_EXE_DATA);
    return Data;
}

