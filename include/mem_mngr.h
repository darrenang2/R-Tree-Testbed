#ifndef MEM_MNGR_H
#define MEM_MNGR_H

#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"

void memory_manager(
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search,
    hls::stream<Node> &cst2mem,
    hls::stream<int> &mem2cst,
    hls::stream<Node> &insert2mem,
    hls::stream<int> &mem2insert,
    hls::stream<int> &index2mem,
    Node *HBM_PTR);

#endif // MEM_MNGR_H