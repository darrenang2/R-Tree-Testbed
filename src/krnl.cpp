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
#include "krnlSearch.h"
#include "krnlInsert.h"

extern "C" void krnl(
    Node *HBM_PTR,
    ap_uint<32> *operations,
    int number_of_operations,
    ap_uint<256> *parameters_for_operations,
    // RDMA
    int board_num,
    int exe)
{
#pragma HLS INTERFACE mode = m_axi port = HBM_PTR
#pragma HLS INTERFACE mode = m_axi port = operations
#pragma HLS INTERFACE mode = m_axi port = parameters_for_operations

    int operation = 0;
    int debugCounter = 0;
    ap_uint<32> curr;
    ap_uint<256> param;
    data_t searchResult;
    data_t insertResult;
    static bool startChooseSubtree = true;

    static hls::stream<boundingBox> searchInput;
    static hls::stream<data_t> searchOutput;
    static hls::stream<int> search2mem;
    static hls::stream<Node> mem2search;

    static hls::stream<Node> cst2mem;
    static hls::stream<int> mem2cst;
    static hls::stream<Node> cstInput;
    static hls::stream<int> cstOutput;

    static hls::stream<Node> insert2mem;
    static hls::stream<int> mem2insert;
    static hls::stream<int> index2mem;
    static hls::stream<Node> insertInput;
    static hls::stream<int> insertOutput;

#pragma HLS STREAM depth = 8 variable = search2mem
#pragma HLS STREAM depth = 8 variable = mem2search
#pragma HLS STREAM depth = 8 variable = cst2mem
#pragma HLS STREAM depth = 8 variable = mem2cst
#pragma HLS STREAM depth = 8 variable = insert2mem
#pragma HLS STREAM depth = 8 variable = mem2insert

    while (operation < number_of_operations && debugCounter < exe)
    // search = 00, insert = 01, delete = 10

    {
        debugCounter++;

        curr = operations[operation];
        param = parameters_for_operations[operation];

        if (curr.range(1, 0) == 0 && !searchInput.full())
        {
            boundingBox searchTerm = setBB(param.range(15, 0), param.range(31, 16), param.range(47, 32), param.range(63, 48));
            searchInput.write(searchTerm);
            search(
                searchInput,
                searchOutput,
                search2mem,
                mem2search);
        }

        while (!searchOutput.empty())
        {
            operation++;
            searchOutput.read(searchResult);
            std::cout << "Found: " << searchResult << std::endl;
        }

        // if (curr.range(1, 0) == 1)
        // {
        //     if (startChooseSubtree == true)
        //     {
        //         Node newNode = createNode(param.range(224, 224), setBB(param.range(15, 0), param.range(31, 16), param.range(47, 32), param.range(63, 48)), param.range(95, 64), param.range(127, 96), param.range(159, 128), param.range(191, 160), param.range(223, 192));
        //         startChooseSubtree = false;
        //         cstInput.write(newNode);
        //         insertInput.write(newNode);
        //     }
        //     chooseSubTree(
        //         cst2mem,
        //         mem2cst,
        //         cstInput,
        //         cstOutput);

        //     insert(
        //         insert2mem,
        //         mem2insert,
        //         index2mem,
        //         cstOutput,
        //         insertInput,
        //         insertOutput);
        // }

        // if (!insertOutput.empty())
        // {
        //     startChooseSubtree = true;
        //     operation++;
        //     insertOutput.read(insertResult);
        //     std::cout << "Insert: " << insertResult << std::endl;
        //     // 2 = no overflow, 1 = overflow
        // }

        memory_manager(
            search2mem,
            mem2search,
            cst2mem,
            mem2cst,
            insert2mem,
            mem2insert,
            index2mem,
            HBM_PTR);
    }
}