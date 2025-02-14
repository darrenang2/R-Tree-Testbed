// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_H
#define XKRNL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xkrnl_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XKrnl_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XKrnl_Initialize(XKrnl *InstancePtr, u16 DeviceId);
XKrnl_Config* XKrnl_LookupConfig(u16 DeviceId);
int XKrnl_CfgInitialize(XKrnl *InstancePtr, XKrnl_Config *ConfigPtr);
#else
int XKrnl_Initialize(XKrnl *InstancePtr, const char* InstanceName);
int XKrnl_Release(XKrnl *InstancePtr);
#endif


void XKrnl_Set_HBM_PTR(XKrnl *InstancePtr, u64 Data);
u64 XKrnl_Get_HBM_PTR(XKrnl *InstancePtr);
void XKrnl_Set_operations(XKrnl *InstancePtr, u64 Data);
u64 XKrnl_Get_operations(XKrnl *InstancePtr);
void XKrnl_Set_parameters_for_operations(XKrnl *InstancePtr, u64 Data);
u64 XKrnl_Get_parameters_for_operations(XKrnl *InstancePtr);
void XKrnl_Set_number_of_operations(XKrnl *InstancePtr, u32 Data);
u32 XKrnl_Get_number_of_operations(XKrnl *InstancePtr);
void XKrnl_Set_board_num(XKrnl *InstancePtr, u32 Data);
u32 XKrnl_Get_board_num(XKrnl *InstancePtr);
void XKrnl_Set_exe(XKrnl *InstancePtr, u32 Data);
u32 XKrnl_Get_exe(XKrnl *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
