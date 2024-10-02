#ifndef KRNLFUNCTIONS_H
#define KRNLFUNCTIONS_H

#include "constants.h"
#include "stack.h"
#include "node.h"
#include "nodeArray.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "mem_mngr.h"

void chooseSubTree(hls::stream<Node> &cst2mem,
                   hls::stream<int> &mem2cst,
                   hls::stream<Node> &cstInput,
                   hls::stream<int> &cstOutput);

void insert(hls::stream<Node> &insert2mem,
            hls::stream<int> &mem2insert,
            hls::stream<int> &index2mem,
            hls::stream<int> &cstOutput,
            hls::stream<Node> &insertInput,
            hls::stream<int> &insertOutput);

#endif // KRNLFUNCTIONS_H