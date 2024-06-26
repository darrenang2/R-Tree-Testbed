#include "constants.h"
#include "stack.h"
#include "helper.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include <float.h>
#include <iostream>
#include <algorithm>

extern "C" void krnl(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
#pragma HLS INTERFACE mode = m_axi port = output

    // SetBB: (x1 -> x2) (y1 -> y2)

    nodes[0] = createNode(false, setBB(0, 20, 0, 20), 1, 2, 3, 4, 5);
    nodes[1] = createNode(false, setBB(0, 9, 0, 9), 6, 7, -1, -1, -1);
    nodes[2] = createNode(false, setBB(10, 20, 10, 20), 8, 9, -1, -1, -1);
    nodes[3] = createLeaf(true, setBB(0, 4, 0, 4));
    nodes[4] = createLeaf(true, setBB(5, 9, 5, 9));
    nodes[5] = createLeaf(true, setBB(10, 14, 10, 14));
    nodes[6] = createLeaf(true, setBB(15, 19, 15, 19));
    nodes[7] = createLeaf(true, setBB(0, 7, 0, 7));
    nodes[8] = createLeaf(true, setBB(10, 14, 10, 14));
    nodes[9] = createLeaf(true, setBB(17, 19, 17, 19));

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