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

HLS_SOURCES = ../../../../../../src/hls/test_krnl.cpp ../../../../../../src/hls/krnlInsert.cpp ../../../../../../src/hls/areaEnlargementPair.cpp ../../../../../../src/hls/overlapEnlargementPair.cpp ../../../../../../src/hls/nodeArray.cpp ../../../../../../src/hls/node.cpp ../../../../../../src/hls/mem_mngr.cpp ../../../../../../src/hls/krnl.cpp

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
IFLAG += -I/home/pyuva001/R-Tree-Testbed/src/include -Wno-unknown-pragmas 
IFLAG += -g
DFLAG += -D__xilinx_ip_top= -DAESL_TB
CCFLAG += -Werror=return-type
CCFLAG += -Wno-abi
TOOLCHAIN += 



include ./Makefile.rules

all: $(TARGET)



$(ObjDir)/test_krnl.o: ../../../../../../src/hls/test_krnl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/test_krnl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/test_krnl.d

$(ObjDir)/krnlInsert.o: ../../../../../../src/hls/krnlInsert.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/krnlInsert.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/krnlInsert.d

$(ObjDir)/areaEnlargementPair.o: ../../../../../../src/hls/areaEnlargementPair.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/areaEnlargementPair.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/areaEnlargementPair.d

$(ObjDir)/overlapEnlargementPair.o: ../../../../../../src/hls/overlapEnlargementPair.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/overlapEnlargementPair.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/overlapEnlargementPair.d

$(ObjDir)/nodeArray.o: ../../../../../../src/hls/nodeArray.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/nodeArray.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/nodeArray.d

$(ObjDir)/node.o: ../../../../../../src/hls/node.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/node.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/node.d

$(ObjDir)/mem_mngr.o: ../../../../../../src/hls/mem_mngr.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/mem_mngr.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/mem_mngr.d

$(ObjDir)/krnl.o: ../../../../../../src/hls/krnl.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../../../src/hls/krnl.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CC) ${CCFLAG} -c -MMD -I/home/pyuva001/R-Tree-Testbed/src/include  $(IFLAG) $(DFLAG) $< -o $@ ; \

-include $(ObjDir)/krnl.d
