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
    hls::stream<boundingBox>& search2mem,
    hls::stream<boundingBox>& mem2search,
    Node* HBM_PTR
) {

    int node_index; 
    if (!search2mem.empty() && !mem2search.full()) {
        search2mem.read(node_index);
        mem2search.write(HBM_PTR[node_index]);
    }


}

data_t *search(
    // data_t minX, 
    // data_t maxX, 
    // data_t minY, 
    // data_t maxY, 
    hls::stream<boundingBox>& input, 
    hls::stream<data_t>& output,
    hls::stream<data_t>& search2mem,
    hls::stream<Node>& mem2search 
    )
{
    
    enum SearchStates = {INIT, POP, GET_NODE, PUSH, FOUND};
    static SearchStates state = INIT; 

    boundingBox find; 
    Stack stack;
    static int rt = 0;
    //Max size
    data_t found[1000];

    switch(state) {
        case INIT : {
            if (!input.empty()) {
                input.read(find);
                stack.push(get_level_start_index(H));
                state = TRAVERSE;
            }
            break; 
        }

        case POP: {
            if (!stack.isEmpty() && !search2mem.full())
            {
                // int nodeIndex = stack.pop();         // Get the top node from the stack
                // Node currentNode = nodes[nodeIndex]; // Get the current node
                // print_level(H);
                int nodeIndex = stack.pop();
                std::cout << "node index: " << nodeIndex << std::endl;
                search2mem.write(nodeIndex);
                //Node *currentNode = get_node(nodeIndex);
                //printNode(currentNode);
                state = GET_NODE; 
            }
            break; 
        }

        case GET_NODE: {
            if (!mem2search.empty()) {
                mem2search.read(currentNode);
                // Check if current node overlaps with search range
                if (currentNode->leaf)
                {
                    std::cout << "Leaf Node: " << nodeIndex << std::endl;
                    if (currentNode->box.minX <= maxX && currentNode->box.maxX >= minX && currentNode->box.minY <= maxY && currentNode->box.maxY >= minY)
                    {
                        found[rt++] = nodeIndex; // Node index matches search criteria
                    }
                }
                else
                {
                    for (int i = 0; i < MAX_CHILDREN; i++)
                    {
                        if (currentNode->child[i] != -1)
                        {
                            //Node *childNode = get_node(currentNode->child[i]);
                            search2mem.write(currentNode->child[i]);
                            state = PUSH;
                            // printNode(childNode);
                            if (childNode->box.minX <= maxX && childNode->box.maxX >= minX && childNode->box.minY <= maxY && childNode->box.maxY >= minY)
                            {
                                std::cout << "Pushing child " << i << std::endl;
                                stack.push(currentNode->child[i]); // Push child node to stack
                            }
                        }
                    }
                }                
            } else {
                state = FOUND;
            }
            break; 
        }

        case PUSH: {
            if (!mem2search.empty()) {
                mem2search.read(currentNode);
                if (currentNode->box.minX <= maxX && currentNode->box.maxX >= minX && currentNode->box.minY <= maxY && currentNode->box.maxY >= minY)
                {
                    std::cout << "Pushing child " << i << std::endl;
                    stack.push(currentNode); // Push child node to stack
                }  
                if (mem2search.empty()) {
                    state = GET_NODE; 
                }
            }
        }

        case FOUND: {
            if (!output.full()) {
                output.write(found[rt-1]);
                rt--;
                if (rt == 0) {
                    state = INIT; 
                }

            }
        }

    }

}

extern "C" void krnl(
    Node* HBM_PTR, 
    data_t* operations,
    int number_of_operations, 
    //RDMA
    int board_num
)
{
#pragma HLS INTERFACE mode = m_axi port = HBM_PTR
#pragma HLS INTERFACE mode = m_axi port = operation

    int operation = 0; 
    data_t curr; 

    hls::stream<boundingBox> searchInput;
    hls::stream<boundingBox> searchOutput;
    hls::stream<boundingBox> search2mem;
    hls::stream<boundingBox> mem2search;

    while (operations < number_of_operations) {
        
        curr = operations[operation];

        if (curr is search) {
            searchInput.write(search term);   
            search(
                searchInput,
                searchOutput,
                search2mem,
                mem2search
            );
        }

        memory_manager(
            search2mem,
            mem2search,
            HBM_PTR
        )

    }
}