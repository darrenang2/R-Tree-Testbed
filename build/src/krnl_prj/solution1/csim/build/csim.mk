# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
# Tool Version Limit: 2019.12
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# ==============================================================
CSIM_DESIGN = 1

__SIM_FPO__ = 1

__SIM_MATHHLS__ = 1

__SIM_FFT__ = 1

__SIM_FIR__ = 1

__SIM_DDS__ = 1

ObjDir = obj

HLS_SOURCES = ../../../../../../src/test_krnl.cpp ../../../../../../src/krnlInsert.cpp ../../../../../../src/areaEnlargementPair.cpp ../../../../../../src/overlapEnlargementPair.cpp ../../../../../../src/nodeArray.cpp ../../../../../../src/node.cpp ../../../../../../src/mem_mngr.cpp ../../../../../../src/krnlSearch.cpp ../../../../../../src/krnl.cpp

override TARGET := csim.exe

AUTOPILOT_ROOT := /tools/Xilinx/Vitis_HLS/2022.2
AUTOPILOT_MACH := lnx64
ifdef AP_GCC_M32
  AUTOPILOT_MACH := Linux_x86
  IFLAG += -m32
endif
IFLAG += -fPIC
ifndef AP_GCC_PATH
  AP_GCC_PATH := /tools/Xilinx/Vitis_HLS/2022.2/tps/lnx64/gcc-8.3.0/bin
endif
AUTOPILOT_TOOL := ${AUTOPILOT_ROOT}/${AUTOPILOT_MACH}/tools
AP_CLANG_PATH := ${AUTOPILOT_TOOL}/clang-3.9/bin
AUTOPILOT_TECH := ${AUTOPILOT_ROOT}/common/technology


IFLAG += -I "${AUTOPILOT_ROOT}/include"
IFLAG += -I "${AUTOPILOT_ROOT}/include/ap_sysc"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_FP_comp"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_comp"
IFLAG += -I "${AUTOPILOT_TOOL}/auto_cc/include"
IFLAG += -D__HLS_COSIM__

IFLAG += -D__HLS_CSIM__

IFLAG += -D__VITIS_HLS__

IFLAG += -D__SIM_FPO__

IFLAG += -D__SIM_FFT__

IFLAG += -D__SIM_FIR__

IFLAG += -D__SIM_DDS__

IFLAG += -D__DSP48E2__
IFLAG += -I/home/dang004/R-Tree-Testbed/build/src/../../include -Wno-unknown-pragmas 
IFLAG += -g
DFLAG += -D__xilinx_ip_top= -DAESL_TB
CCFLAG += -Werror=return-type
CCFLAG += -Wno-abi
TOOLCHAIN += 



include ./Makefile.rules

all: $(TARGET)



$(ObjDir)/test_krnl.o: ../../../../../../src/test_krnl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/test_krnl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/test_krnl.d

$(ObjDir)/krnlInsert.o: ../../../../../../src/krnlInsert.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/krnlInsert.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/krnlInsert.d

$(ObjDir)/areaEnlargementPair.o: ../../../../../../src/areaEnlargementPair.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/areaEnlargementPair.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/areaEnlargementPair.d

$(ObjDir)/overlapEnlargementPair.o: ../../../../../../src/overlapEnlargementPair.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/overlapEnlargementPair.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/overlapEnlargementPair.d

$(ObjDir)/nodeArray.o: ../../../../../../src/nodeArray.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/nodeArray.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/nodeArray.d

$(ObjDir)/node.o: ../../../../../../src/node.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/node.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/node.d

$(ObjDir)/mem_mngr.o: ../../../../../../src/mem_mngr.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/mem_mngr.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/mem_mngr.d

$(ObjDir)/krnlSearch.o: ../../../../../../src/krnlSearch.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/krnlSearch.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/krnlSearch.d

$(ObjDir)/krnl.o: ../../../../../../src/krnl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/krnl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/dang004/R-Tree-Testbed/build/src/../../include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/krnl.d
