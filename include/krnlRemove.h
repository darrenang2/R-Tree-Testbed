#ifndef KRNLREMOVE_H
#define KRNLREMOVE_H

#include "constants.h"
#include "stack.h"
#include "node.h"
#include "nodeArray.h"
#include "mem_mngr.h"

void remove(hls::stream<int> &removeNodeIndex,
            hls::stream<int> &removeIndex2mem,
            hls::stream<int> &mem2removeLevel,
            hls::stream<int> &mem2removeIndex,
            hls::stream<Node> &mem2node,
            hls::stream<bool> &removeOuput
);

#endif // KRNLSEARCH_H