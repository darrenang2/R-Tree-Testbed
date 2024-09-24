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
#include "krnlSearch.h"
#include "mem_mngr.h"

void chooseSubTree(hls::stream<Node> &cst2mem,
                   hls::stream<int> &mem2cst,
                   hls::stream<Node> &cstInput,
                   hls::stream<int> &cstOutput)
{
    Node newNode;
    int result;

    enum cstStates
    {
        INIT,
        WRITE,
        RECEIVE,
        FOUND
    };
    static cstStates state = INIT;

    switch (state)
    {
    case INIT:
        if (!cstInput.empty())
        {
            cstInput.read(newNode);
            state = WRITE;
        }
        break;
    case WRITE:
        if (!cst2mem.full())
        {
            cst2mem.write(newNode);
            state = FOUND;
        }
        break;
    case RECEIVE:
        if (!mem2cst.empty())
        {
            mem2cst.read(result);
            state = FOUND;
        }
        break;
    case FOUND:
        if (!mem2cst.empty())
        {
            cstOutput.write(result);
        }
        break;
    }
}

void insert(hls::stream<Node> &insert2mem,
            hls::stream<int> &mem2insert,
            hls::stream<int> &index2mem,
            hls::stream<int> &cstOutput,
            hls::stream<Node> &insertInput,
            hls::stream<int> &insertOutput)
{
    static int index = -1;
    static int result = -1;
    static int output = -1;
    Node newNode;

    enum InsertStates
    {
        READ_NODE,
        READ_INDEX,
        WRITE_INDEX,
        INSERT,
        OVERFLOWTREATMENT,
        OUTPUT
    };
    static InsertStates state = READ_NODE;

    switch (state)
    {
    case READ_NODE:
        if (!insertInput.empty())
        {
            insertInput.read(newNode);
            state = READ_INDEX;
        }
        break;
    case READ_INDEX:
        if (!cstOutput.empty())
        {
            cstOutput.read(index);
            state = WRITE_INDEX;
        }
        break;
    case WRITE_INDEX:
        if (!index2mem.empty())
        {
            index2mem.write(index);
            state = INSERT;
        }
        break;
    case INSERT:
        if (!insert2mem.full())
        {
            insert2mem.write(newNode);
            state = OVERFLOWTREATMENT;
        }
        break;
    case OVERFLOWTREATMENT:
        if (!mem2insert.empty())
        {
            mem2insert.read(result);
        }
    case OUTPUT:
        if (!insertOutput.full())
        {
            // OUTPUT = 1 if insertion is successful, 2 if overflow treatment is required
            insertOutput.write(output);
        }
        break;
    }
}
