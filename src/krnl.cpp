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

extern "C" void krnl(data_t *output)
{
#pragma HLS INTERFACE mode = m_axi port = output

    // SetBB: (x1 -> x2) (y1 -> y2)

    add_node(H, createNode(false, setBB(0, 20, 0, 20),
                           get_level_start_index(H - 1),
                           get_level_start_index(H - 1) + 1,
                           get_level_start_index(H - 1) + 2, -1, -1)); // node 0 (root node)

    add_node(H - 1, createNode(false, setBB(0, 9, 0, 9),
                               get_level_start_index(H - 2),
                               get_level_start_index(H - 2) + 1,
                               get_level_start_index(H - 2) + 2,
                               get_level_start_index(H - 2) + 3,
                               get_level_start_index(H - 2) + 4)); // node 1

    add_node(H - 1, createNode(false, setBB(10, 20, 10, 20),
                               get_level_start_index(H - 2) + 5,
                               get_level_start_index(H - 2) + 6, -1, -1, -1)); // node 2

    add_node(H - 1, createNode(false, setBB(0, 16, 0, 16), -1, -1, -1, -1, -1));

    add_node(H - 2, createLeaf(true, setBB(0, 4, 0, 4)));     // node 3
    add_node(H - 2, createLeaf(true, setBB(5, 9, 5, 9)));     // node 4
    add_node(H - 2, createLeaf(true, setBB(10, 14, 10, 14))); // node 5
    add_node(H - 2, createLeaf(true, setBB(15, 19, 15, 19))); // node 6
    add_node(H - 2, createLeaf(true, setBB(0, 7, 0, 7)));     // node 7
    add_node(H - 2, createLeaf(true, setBB(10, 14, 10, 14))); // node 8
    add_node(H - 2, createLeaf(true, setBB(17, 19, 17, 19))); // node 9

    // print_level(0);
    // print_level(1);
    // print_level(2);

    // search(1, 6, 1, 6, output);

    // volatile int x = minX;
    // volatile int y = minY;
    // volatile int x2 = maxX;
    // volatile int y2 = maxY;
    // output[0] = minX + maxX + minY + maxY;

    // createNode();

    // Node node = split(get_node(H, 0));
    // printNode(&node);
    // print_all_levels;
    // print_level(0);
    // print_level(1);
    // print_level(2);
    // print_level(3);

    // if (node.leaf == true) {
    //     output[0] = 1;
    // }

    // Node node = overflowTreatment(get_node(2, 0), true);
    // std::cout << "Height of tree: " << H << std::endl;
    // printNode(&node);

    // reinsert(get_node(1, 0));

    // insert(createNode(true, setBB(0, 30, 0, 30), -1, -1, -1, -1, -1), true);

    // printNode(get_node(0, 5));
    // printNode(get_node(0, 6));

    remove(1, 0);
    print_level(1);
}