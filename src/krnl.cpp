#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include <float.h>
#include <iostream>
#include <algorithm>

/*==================================================== INITIALIZE DATA ===============================================================*/

int currNumNodes = 10; // Current number of Nodes

/*==================================================== SEARCH FUNCTIONS ===============================================================*/

int search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
    std::cout << "R-Tree Search: (" << minX << "->" << maxX << ")(" << minY << "->" << maxY << ")" << std::endl;
    // Return counter;
    int rt = 0;

    Stack stack;

    stack.push(0); // Start with the root node index

    while (!stack.isEmpty())
    {
        int nodeIndex = stack.pop();         // Get the top node from the stack
        Node currentNode = nodes[nodeIndex]; // Get the current node

        // Check if current node overlaps with search range
        if (currentNode.leaf)
        {
            if (currentNode.box.minX <= maxX && currentNode.box.maxX >= minX && currentNode.box.minY <= maxY && currentNode.box.maxY >= minY)
            {
                output[rt++] = nodeIndex; // Node index matches search criteria
            }
        }
        else
        {
            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                Node childNode = getChild(currentNode, i);
                if (childNode.box.minX <= maxX && childNode.box.maxX >= minX && childNode.box.minY <= maxY && childNode.box.maxY >= minY)
                {
                    stack.push(currentNode.child[i]); // Push child node to stack
                }
            }
        }
    }
    std::cout << "Number of nodes with overlap: " << rt << std::endl;
    return rt;
}

/*==================================================== SPLIT FUNCTIONS ===============================================================*/

// void splitNode(Node node)

/*==================================================== INSERTION FUNCTIONS ===============================================================*/

areaEnlargementPair AreaEnlargementArray[MAX];

void sortByAreaEnlargement(Node newNode)
{
    int i = 0;
    int area_maxX, area_maxY, area_minX, area_minY;
    int area_enlargement;
    Stack stack;
    stack.push(0); // Start with the root node index
    while (!stack.isEmpty())
    {
        int nodeIndex = stack.pop();
        Node currentNode = nodes[nodeIndex];

        if (currentNode.leaf)
        {
            // the node being compared to new node is leaf
            area_maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            area_maxY = std::max(currentNode.box.maxY, newNode.box.maxY);
            area_minX = std::min(currentNode.box.minX, newNode.box.minX);
            area_minY = std::min(currentNode.box.minY, newNode.box.minY);

            area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - area(currentNode.box);
            std::cout << "Area Enlargement: " << area_enlargement << " Leaf Node: " << nodeIndex << std::endl;
            areaEnlargementPair pair = {nodeIndex, area_enlargement};
            AreaEnlargementArray[i++] = pair;
        }
        else
        {
            if (currentNode.box.maxX >= newNode.box.maxX && currentNode.box.minX <= newNode.box.minX && currentNode.box.maxY >= newNode.box.maxY && currentNode.box.minY <= newNode.box.minY)
            {
                // new node is within the bounding box
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode.child[i] != -1)
                        stack.push(currentNode.child[i]);
                }
            }
            else
            {
                // new node is not within the bounding box
                area_maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
                area_maxY = std::max(currentNode.box.maxY, newNode.box.maxY);
                area_minX = std::min(currentNode.box.minX, newNode.box.minX);
                area_minY = std::min(currentNode.box.minY, newNode.box.minY);

                area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - area(currentNode.box);
                std::cout << "Area Enlargement: " << area_enlargement << " Node: " << nodeIndex << std::endl;
                areaEnlargementPair pair = {nodeIndex, area_enlargement};
                AreaEnlargementArray[i++] = pair;
            }
        }
    }
    sort(AreaEnlargementArray, i);
}

overlapEnlargementPair OverlapEnlargementArray[MAX];

void sortByOverlapEnlargement(Node newNode)
{
    int i = 0;
    int maxX, maxY, minX, minY;
    Stack stack;
    for (int i = 0; i < currNumNodes / 2; i++)
    {
        stack.push(AreaEnlargementArray[i].index);
    }
    while (!stack.isEmpty())
    {
        int nodeIndex = stack.pop();
        Node currentNode = nodes[nodeIndex];

        // the node being compared to new node is leaf
        maxX = std::min(currentNode.box.maxX, newNode.box.maxX);
        maxY = std::min(currentNode.box.maxY, newNode.box.maxY);
        minX = std::max(currentNode.box.minX, newNode.box.minX);
        minY = std::max(currentNode.box.minY, newNode.box.minY);

        int overlap = (maxX - minX) * (maxY - minY);
        std::cout << "Overlap: " << overlap << " Node: " << nodeIndex << std::endl;
        overlapEnlargementPair pair = {nodeIndex, overlap};
        OverlapEnlargementArray[i++] = pair;
    }
    sort(OverlapEnlargementArray, i);
}

int chooseSubTree(Node node)
{
    /*
        call sortByAreaEnlargement first
        call sortByOverlapEnlargement
        check all nodes in areaEnlargmentArray: if leaf node, choose node with least overlap enlargement
        if no leaf nodes, choose node with least area enlargement
    */

    sortByAreaEnlargement(node);
    sortByOverlapEnlargement(node);

    return OverlapEnlargementArray[0].index;
}

void insert(data_t minX, data_t maxX, data_t minY, data_t maxY)
{
    Node newNode = createLeaf(true, setBB(minX, maxX, minY, maxY));
    // for (int i = 0; i < currNumNodes; i++)
    int count = 0;
    Stack stack;
    stack.push(count); // Start with the root node index

    do
    {
        int nodeIndex = stack.pop();
        Node currentNode = nodes[nodeIndex];

        // if is leaf (Lindex = -1)
        // insert node into Lindex
        // else if Rindex = -1
        // insert node into Rindex
        // else
        // insert into stack (choose subtree)
        // update left index / right index of parent node

        if (currentNode.leaf)
        {
            std::cout << "Adding child 0" << std::endl;
            // currentNodeParent = Node();
            currentNode.leaf = false;

            currentNode.child[0] = currNumNodes;
            nodes[currNumNodes] = newNode; // currNumNodes = array index of newest node, gets updated everytime a node is added
            currNumNodes++;

            currentNode.box.minX = std::min(currentNode.box.minX, newNode.box.minX);
            currentNode.box.maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            currentNode.box.minY = std::min(currentNode.box.minY, newNode.box.minY);
            currentNode.box.maxY = std::max(currentNode.box.maxY, newNode.box.maxY);

            nodes[nodeIndex] = currentNode;
        }
        else if (currentNode.child[1] == -1)
        {
            std::cout << "Adding child 1" << std::endl;
            newNode.leaf = 1;

            currentNode.child[1] = currNumNodes;
            nodes[currNumNodes] = newNode;
            currNumNodes++;

            currentNode.box.minX = std::min(currentNode.box.minX, newNode.box.minX);
            currentNode.box.maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            currentNode.box.minY = std::min(currentNode.box.minY, newNode.box.minY);
            currentNode.box.maxY = std::max(currentNode.box.maxY, newNode.box.maxY);

            nodes[nodeIndex] = currentNode;
        }
        else if (currentNode.child[2] == -1)
        {
            std::cout << "Adding child 2" << std::endl;
            newNode.leaf = 1;

            currentNode.child[2] = currNumNodes;
            nodes[currNumNodes] = newNode;
            currNumNodes++;

            currentNode.box.minX = std::min(currentNode.box.minX, newNode.box.minX);
            currentNode.box.maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            currentNode.box.minY = std::min(currentNode.box.minY, newNode.box.minY);
            currentNode.box.maxY = std::max(currentNode.box.maxY, newNode.box.maxY);

            nodes[nodeIndex] = currentNode;
        }
        else if (currentNode.child[3] == -1)
        {
            std::cout << "Adding child 3" << std::endl;
            newNode.leaf = 1;

            currentNode.child[3] = currNumNodes;
            nodes[currNumNodes] = newNode;
            currNumNodes++;

            currentNode.box.minX = std::min(currentNode.box.minX, newNode.box.minX);
            currentNode.box.maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            currentNode.box.minY = std::min(currentNode.box.minY, newNode.box.minY);
            currentNode.box.maxY = std::max(currentNode.box.maxY, newNode.box.maxY);

            nodes[nodeIndex] = currentNode;
        }
        else if (currentNode.child[4] == -1)
        {
            std::cout << "Adding child 4" << std::endl;
            newNode.leaf = 1;

            currentNode.child[4] = currNumNodes;
            nodes[currNumNodes] = newNode;
            currNumNodes++;

            currentNode.box.minX = std::min(currentNode.box.minX, newNode.box.minX);
            currentNode.box.maxX = std::max(currentNode.box.maxX, newNode.box.maxX);
            currentNode.box.minY = std::min(currentNode.box.minY, newNode.box.minY);
            currentNode.box.maxY = std::max(currentNode.box.maxY, newNode.box.maxY);

            nodes[nodeIndex] = currentNode;
        }
        else if (currentNode.child[5] == -1)
        {
            std::cout << "Calling OverflowTreatment" << std::endl;
            // overFlowTreatment();
        }
        else
        {
            stack.push(++count);
            // chooseSubTree();
        }

        // if leaves > max
        // overFlowTreatment();

    } while (!stack.isEmpty() && count < MAX);
}

void reinsert(Node node)
{
    /*
    For all M+l entries of a node N, compute the distance
    between the centers of their rectangles and the center
    of the bounding rectangle of N

    Sort the entries m decreasmg order of their distances
    computed in RI1
    */
    for (int i = 1; i < MAX_CHILDREN; i++)
    {
        int key = node.child[i];
        int j = i - 1;
        while (j >= 0 && computeDistCenters(nodes[node.child[j]], node) > computeDistCenters(nodes[key], node) && node.child[j] != -1)
        {
            node.child[j + 1] = node.child[j];
            j = j - 1;
        }
        node.child[j + 1] = key;
        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            std::cout << "Child " << i << ": " << node.child[i] << std::endl;
        }
    }

    /*
    Remove the first p entries from N and adjust the
    bounding rectangle of N

    In the sort, defined in RI2, starting with the maximum
    distance (= far reinsert) or minimum distance (= close
    reinsert), invoke Insert to reinsert the entries
    */
    insert(nodes[node.child[5]].box.minX, nodes[node.child[5]].box.maxX, nodes[node.child[5]].box.minY, nodes[node.child[5]].box.maxY);

    node.child[5] = -1;

    int minX, maxX, minY, maxY;
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (node.child[i] != -1)
        {
            minX = std::min(minX, nodes[node.child[i]].box.minX);
            maxX = std::max(maxX, nodes[node.child[i]].box.maxX);
            minY = std::min(minY, nodes[node.child[i]].box.minY);
            maxY = std::max(maxY, nodes[node.child[i]].box.maxY);
        }
    }

    setBB(&node, minX, maxX, minY, maxY);
}

/*==================================================== DELETION FUNCTIONS ===============================================================*/

// Node deleteNode(Node node)
// {
// }

/*==================================================== KERNEL ===============================================================*/

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

    reinsert(nodes[0]);

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