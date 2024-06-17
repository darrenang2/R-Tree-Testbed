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
    stack.push(0);
    while (!stack.isEmpty())
    {
        int nodeIndex = stack.pop();
        Node currentNode = nodes[nodeIndex];

        if (currentNode.leaf)
        {
            // the node being compared to new node is leaf
            maxX = std::min(currentNode.box.maxX, newNode.box.maxX);
            maxY = std::min(currentNode.box.maxY, newNode.box.maxY);
            minX = std::max(currentNode.box.minX, newNode.box.minX);
            minY = std::max(currentNode.box.minY, newNode.box.minY);

            int overlap = (maxX - minX) * (maxY - minY);
            std::cout << "Overlap: " << overlap << " Leaf Node: " << nodeIndex << std::endl;
            overlapEnlargementPair pair = {nodeIndex, overlap};
            OverlapEnlargementArray[i++] = pair;
        }
        else
        {
            // // overlap of left child
            // maxX = std::min(currentNode.LmaxX, newNode.box.maxX);
            // maxY = std::min(currentNode.LmaxY, newNode.box.maxY);
            // minX = std::max(currentNode.LminX, newNode.box.minX);
            // minY = std::max(currentNode.LminY, newNode.box.minY);
            // int leftOverlap = (maxX - minX) * (maxY - minY);
            // std::cout << "Left Overlap: " << leftOverlap << " Node: " << nodeIndex << std::endl;

            // // overlap of right child
            // maxX = std::min(currentNode.RmaxX, newNode.box.maxX);
            // maxY = std::min(currentNode.RmaxY, newNode.box.maxY);
            // minX = std::max(currentNode.RminX, newNode.box.minX);
            // minY = std::max(currentNode.RminY, newNode.box.minY);
            // int rightOverlap = (maxX - minX) * (maxY - minY);
            // std::cout << "Right Overlap: " << rightOverlap << " Node: " << nodeIndex << std::endl;

            // // push node with least overlap
            // if (leftOverlap < rightOverlap)
            // {
            //     stack.push(currentNode.Lindex);
            //     overlapEnlargementPair pair = {nodeIndex, leftOverlap};
            //     OverlapEnlargementArray[i++] = pair;
            // }
            // else
            // {
            //     stack.push(currentNode.Rindex);
            //     overlapEnlargementPair pair = {nodeIndex, rightOverlap};
            //     OverlapEnlargementArray[i++] = pair;
            // }

            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                Node childNode = getChild(currentNode, i);
                maxX = std::min(childNode.box.maxX, newNode.box.maxX);
                maxY = std::min(childNode.box.maxY, newNode.box.maxY);
                minX = std::max(childNode.box.minX, newNode.box.minX);
                minY = std::max(childNode.box.minY, newNode.box.minY);

                int overlap = (maxX - minX) * (maxY - minY);
                // push node with least overlap
                if (currentNode.child[i] != -1)
                    stack.push(currentNode.child[i]);
                overlapEnlargementPair pair = {nodeIndex, overlap};
                OverlapEnlargementArray[i++] = pair;
            }
        }
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
    for (int i = 0; i < currNumNodes / 2; i++)
    {
        if (nodes[AreaEnlargementArray[i].index].leaf)
        {
            sortByOverlapEnlargement(nodes[AreaEnlargementArray[i].index]);
        }
    }

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
        else
        {
            stack.push(++count);
            // chooseSubTree();
        }

        // if leaves > max
        // overFlowTreatment();

    } while (!stack.isEmpty() && count < MAX);
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

    // for (int i = 0; i < currNumNodes; i++)
    // {
    //     if (!nodes[i].leaf)
    //     {
    //         std::cout << "Node " << i << ": " << nodes[i].box.minX << "->" << nodes[i].box.maxX << " " << nodes[i].box.minY << "->" << nodes[i].box.maxY <<
    //          " child 0:" << nodes[i].child[0] << " child 1:" << nodes[i].child[1] << " child 2:" << nodes[i].child[2] << " child 3:" << nodes[i].child[3] 
    //          << " child 4:" << nodes[i].child[4] << std::endl;
    //     }
    //     else
    //     {
    //         std::cout << "Leaf " << i << ": " << nodes[i].box.minX << "->" << nodes[i].box.maxX << " " << nodes[i].box.minY << "->" << nodes[i].box.maxY << std::endl;
    //     }
    // }

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
}