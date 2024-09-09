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

void memory_manager(
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search,
    Node *HBM_PTR)
{
    int node_index;
    if (!search2mem.empty() && !mem2search.full())
    {
        search2mem.read(node_index);
        std::cout << "Requesting: " << node_index << std::endl;
        mem2search.write(HBM_PTR[node_index]);
        std::cout << "Writing: " << node_index << std::endl;
    }
}

void search(
    hls::stream<boundingBox> &input,
    hls::stream<data_t> &output,
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search)
{
    enum SearchStates
    {
        INIT,
        POP,
        GET_NODE,
        PUSH,
        FOUND
    };
    static SearchStates state = INIT;

    boundingBox find;
    static Stack stack;
    static int rt = 0;
    static int ch = 0;
    static int pushIndex = 0;
    Node currentNode;
    static int nodeIndex;
    // Max size
    static data_t found[1000];
    static data_t child[10];

    switch (state)
    {
    case INIT:
    {
        std::cout << "STATE: INIT" << std::endl;
        if (!input.empty())
        {
            input.read(find);
            stack.push(get_level_start_index(H));
            std::cout << "Search: " << find.minX << " " << find.maxX << " " << find.minY << " " << find.maxY << std::endl;
            state = POP;
        }
        break;
    }

    case POP:
    {
        std::cout << "STATE: POP" << std::endl;
        if (!stack.isEmpty() && !search2mem.full())
        {
            nodeIndex = stack.pop();
            std::cout << "node index: " << nodeIndex << std::endl;
            search2mem.write(nodeIndex);
            state = GET_NODE;
        }
        else
        {
            state = FOUND;
        }
        break;
    }

    case GET_NODE:
    {
        if (!mem2search.empty())
        {
            state = POP;
            std::cout << "STATE: GET_NODE" << std::endl;
            mem2search.read(currentNode);
            if (currentNode.leaf)
            {
                std::cout << "Leaf Node: " << nodeIndex << std::endl;
                if (currentNode.box.minX <= find.maxX && currentNode.box.maxX >= find.minX &&
                    currentNode.box.minY <= find.maxY && currentNode.box.maxY >= find.minY)
                {
                    std::cout << "Adding Leaf Node to Found: " << nodeIndex << std::endl;
                    found[rt++] = nodeIndex; // Node index matches search criteria
                }
            }
            else
            {
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode.child[i] != -1)
                    {
                        search2mem.write(currentNode.child[i]);
                        child[ch++] = currentNode.child[i];
                        state = PUSH;
                    }
                }
            }
        }

        break;
    }

    case PUSH:
    {
        std::cout << "STATE: PUSH" << std::endl;
        if (!mem2search.empty())
        {
            mem2search.read(currentNode);
            std::cout << "Current Node: " << currentNode.box.minX << " " << currentNode.box.maxX << " " << currentNode.box.minY << " " << currentNode.box.maxY << std::endl;
            if (currentNode.box.minX <= find.maxX && currentNode.box.maxX >= find.minX && currentNode.box.minY <= find.maxY && currentNode.box.maxY >= find.minY)
            {
                std::cout << "Pushing Child: " << child[pushIndex] << std::endl;
                stack.push(child[pushIndex++]); // Push child node to stack
            }
            else
            {
                pushIndex++;
            }
            if (stack.isEmpty())
            {
                state = FOUND;
            }
            else if (pushIndex == ch)
            {
                pushIndex = 0;
                ch = 0;
                state = POP;
            }
        }
        break;
    }

    case FOUND:
    {
        std::cout << "STATE: FOUND" << std::endl;
        for (int i = 0; i < rt; i++)
        {
            output.write(found[i]); // Write found nodes
            if (rt < 0)
            {
                state = INIT;
            }
        }
        break;
    }
    }
}

extern "C" void krnl(
    Node *HBM_PTR,
    ap_uint<32> *operations,
    int number_of_operations,
    ap_uint<64> *parameters_for_operations,
    // RDMA
    int board_num,
    int exe)
{
#pragma HLS INTERFACE mode = m_axi port = HBM_PTR
#pragma HLS INTERFACE mode = m_axi port = operations

    int operation = 0;
    int debugCounter = 0;
    ap_uint<32> curr;
    ap_uint<64> param;
    data_t temp;

    static hls::stream<boundingBox> searchInput;
    static hls::stream<data_t> searchOutput;
    static hls::stream<int> search2mem;
    static hls::stream<Node> mem2search;

#pragma HLS STREAM depth = 8 variable = search2mem
#pragma HLS STREAM depth = 8 variable = mem2search

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
            searchOutput.read(temp);
            std::cout << "Found: " << temp << std::endl;
        }

        memory_manager(
            search2mem,
            mem2search,
            HBM_PTR);
    }
}
