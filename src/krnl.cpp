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

extern "C" void krnl(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
#pragma HLS INTERFACE mode = m_axi port = output

    // SetBB: (x1 -> x2) (y1 -> y2)

    add_node(MAX_LEVELS, createNode(false, setBB(0, 20, 0, 20),
                                    get_level_start_index(MAX_LEVELS - 1),
                                    get_level_start_index(MAX_LEVELS - 1) + 1,
                                    get_level_start_index(MAX_LEVELS - 2),
                                    get_level_start_index(MAX_LEVELS - 2) + 1,
                                    get_level_start_index(MAX_LEVELS - 2) + 2)); // node 0 (root node)

    add_node(MAX_LEVELS - 1, createNode(false, setBB(0, 9, 0, 9),
                                        get_level_start_index(MAX_LEVELS - 2) + 3,
                                        get_level_start_index(MAX_LEVELS - 2) + 4, -1, -1, -1)); // node 1

    add_node(MAX_LEVELS - 1, createNode(false, setBB(10, 20, 10, 20),
                                        get_level_start_index(MAX_LEVELS - 2) + 5,
                                        get_level_start_index(MAX_LEVELS - 2) + 6, -1, -1, -1)); // node 2

    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(0, 4, 0, 4)));     // node 3
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(5, 9, 5, 9)));     // node 4
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(10, 14, 10, 14))); // node 5
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(15, 19, 15, 19))); // node 6
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(0, 7, 0, 7)));     // node 7
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(10, 14, 10, 14))); // node 8
    add_node(MAX_LEVELS - 2, createLeaf(true, setBB(17, 19, 17, 19))); // node 9

    // search(minX, maxY, minY, maxY, output);

    // insert(1, 3, 1, 3);
    // insert(3, 4, 3, 4);
    // insert(6, 9, 6, 9);

    // sortByAreaEnlargement(nodes[7]);
    // sortByOverlapEnlargement(nodes[7]);

    // int ind = chooseSubTree(nodes[7]);

    // std::cout << "Sorted Area Enlargement Array" << std::endl;
    // for (int i = 0; i < currNumNodes / 2; i++)
    // {
    //     std::cout << "Index: " << AreaEnlargementArray[i].index << " Area Enlargement: " << AreaEnlargementArray[i].areaEnlargement << std::endl;
    // }

    // std::cout << "Sorted Overlap Enlargement Array" << std::endl;
    // for (int i = 0; i < currNumNodes / 2; i++)
    // {
    //     std::cout << "Index: " << OverlapEnlargementArray[i].index << " Overlap Enlargement: " << OverlapEnlargementArray[i].overlapEnlargement << std::endl;
    // }

    // std::cout << "chooseSubTree Index: " << ind << std::endl;

    // reinsert(nodes[1]);

    // for (int i = 0; i < currNumNodes; i++)
    // {
    //     if (!nodes[i].leaf)
    //     {
    //         std::cout << "Node " << i << ": " << nodes[i].box.minX << "->" << nodes[i].box.maxX << " " << nodes[i].box.minY << "->" << nodes[i].box.maxY
    //                   << " child 0:" << nodes[i].child[0] << " child 1:" << nodes[i].child[1] << " child 2:" << nodes[i].child[2] << " child 3:" << nodes[i].child[3]
    //                   << " child 4:" << nodes[i].child[4] << std::endl;
    //     }
    //     else
    //     {
    //         std::cout << "Leaf " << i << ": " << nodes[i].box.minX << "->" << nodes[i].box.maxX << " " << nodes[i].box.minY << "->" << nodes[i].box.maxY << std::endl;
    //     }
    // }
}