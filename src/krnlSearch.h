#ifndef KRNLSEARCH_H
#define KRNLSEARCH_H

#include "constants.h"
#include "stack.h"
#include "helper.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include <float.h>
#include <iostream>
#include <algorithm>
#include "mem_mngr.h"

void search(hls::stream<boundingBox> &input,
    hls::stream<data_t> &output,
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search);

#endif // KRNLSEARCH_H