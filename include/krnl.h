#ifndef KRNL_H
#define KRNL_H

#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include <float.h>
#include <iostream>
#include <algorithm>
#include "mem_mngr.h"
// #include "krnlSearch.h"
#include "krnlInsert.h"
// #include "krnlRemove.h"

extern "C" void krnl(
    Node *HBM_PTR,
    ap_uint<32> *operations,
    int number_of_operations,
    ap_uint<64> *parameters_for_operations,
    // RDMA
    int board_num,
    int exe);

#endif