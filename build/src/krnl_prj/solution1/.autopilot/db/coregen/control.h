// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of HBM_PTR
//        bit 31~0 - HBM_PTR[31:0] (Read/Write)
// 0x14 : Data signal of HBM_PTR
//        bit 31~0 - HBM_PTR[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of operations
//        bit 31~0 - operations[31:0] (Read/Write)
// 0x20 : Data signal of operations
//        bit 31~0 - operations[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of parameters_for_operations
//        bit 31~0 - parameters_for_operations[31:0] (Read/Write)
// 0x2c : Data signal of parameters_for_operations
//        bit 31~0 - parameters_for_operations[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of number_of_operations
//        bit 31~0 - number_of_operations[31:0] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of board_num
//        bit 31~0 - board_num[31:0] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of exe
//        bit 31~0 - exe[31:0] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_HBM_PTR_DATA                   0x10
#define CONTROL_BITS_HBM_PTR_DATA                   64
#define CONTROL_ADDR_OPERATIONS_DATA                0x1c
#define CONTROL_BITS_OPERATIONS_DATA                64
#define CONTROL_ADDR_PARAMETERS_FOR_OPERATIONS_DATA 0x28
#define CONTROL_BITS_PARAMETERS_FOR_OPERATIONS_DATA 64
#define CONTROL_ADDR_NUMBER_OF_OPERATIONS_DATA      0x34
#define CONTROL_BITS_NUMBER_OF_OPERATIONS_DATA      32
#define CONTROL_ADDR_BOARD_NUM_DATA                 0x3c
#define CONTROL_BITS_BOARD_NUM_DATA                 32
#define CONTROL_ADDR_EXE_DATA                       0x44
#define CONTROL_BITS_EXE_DATA                       32
