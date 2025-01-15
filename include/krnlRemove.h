#ifndef KRNLREMOVE_H
#define KRNLREMOVE_H

#include "constants.h"
#include "stack.h"
#include "node.h"
#include "nodeArray.h"
#include "mem_mngr.h"

void remove(hls::stream<int> &removeInputLevel,
            hls::stream<int> &removeInputIndex,
            hls::stream<int> &removeLevel2mem,
            hls::stream<int> &removeIndex2mem,
            hls::stream<int> &mem2removeLevel,
            hls::stream<int> &mem2removeIndex,
            hls::stream<Node> &mem2node,
            hls::stream<Node> &mem2overflow,
            hls::stream<Node> &overflow2mem,
            Node *HBM_PTR);

#endif // KRNLSEARCH_H