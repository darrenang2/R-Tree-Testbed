#include "helper.h"
#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include <float.h>
#include <iostream>
#include <algorithm>

/*==================================================== INITIALIZE DATA ================================================================*/

static int currNumNodes = 10;

/*==================================================== SEARCH FUNCTIONS ===============================================================*/

/**
 * Searches for nodes in the R-Tree that overlap with the given search range.
 *
 * @param minX The minimum x-coordinate of the search range.
 * @param maxX The maximum x-coordinate of the search range.
 * @param minY The minimum y-coordinate of the search range.
 * @param maxY The maximum y-coordinate of the search range.
 * @param output An array to store the indices of the nodes that overlap with the search range.
 * @return The number of nodes that overlap with the search range.
 */
int search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
    std::cout << "R-Tree Search: (" << minX << "->" << maxX << ")(" << minY << "->" << maxY << ")" << std::endl;
    // Return counter;
    int rt = 0;

    Stack stack;

    stack.push(0); // Start with the root node index

    while (!stack.isEmpty())
    {
        // int nodeIndex = stack.pop();         // Get the top node from the stack
        // Node currentNode = nodes[nodeIndex]; // Get the current node

        Node *currentNode = get_node(MAX_LEVELS, 0);

        // Check if current node overlaps with search range
        if (currentNode->leaf)
        {
            if (currentNode->box.minX <= maxX && currentNode->box.maxX >= minX && currentNode->box.minY <= maxY && currentNode->box.maxY >= minY)
            {
                output[rt++] = get_index(currentNode); // Node index matches search criteria
            }
        }
        else
        {
            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                Node childNode = getChild(currentNode, i);
                if (childNode.box.minX <= maxX && childNode.box.maxX >= minX && childNode.box.minY <= maxY && childNode.box.maxY >= minY)
                {
                    stack.push(currentNode->child[i]); // Push child node to stack
                }
            }
        }
    }
    std::cout << "Number of nodes with overlap: " << rt << std::endl;
    return rt;
}

/*==================================================== INSERTION FUNCTIONS ===============================================================*/

areaEnlargementPair AreaEnlargementArray[MAX];

/**
 * Sorts the nodes in the R-tree by area enlargement when inserting a new node.
 *
 * @param newNode The new node to be inserted.
 */
void sortByAreaEnlargement(Node newNode)
{
    int i = 0;
    int area_maxX, area_maxY, area_minX, area_minY;
    int area_enlargement;
    Stack stack;
    stack.push(0); // Start with the root node index
    while (!stack.isEmpty())
    {
        // int nodeIndex = stack.pop();
        // Node currentNode = nodes[nodeIndex];

        Node *currentNode = get_node(MAX_LEVELS, 0);

        if (currentNode->leaf)
        {
            // the node being compared to new node is leaf
            area_maxX = std::max(currentNode->box.maxX, newNode.box.maxX);
            area_maxY = std::max(currentNode->box.maxY, newNode.box.maxY);
            area_minX = std::min(currentNode->box.minX, newNode.box.minX);
            area_minY = std::min(currentNode->box.minY, newNode.box.minY);

            area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - area(currentNode->box);
            std::cout << "Area Enlargement: " << area_enlargement << " Leaf Node: " << get_index(currentNode) << std::endl;
            areaEnlargementPair pair = {get_index(currentNode), area_enlargement};
            AreaEnlargementArray[i++] = pair;
        }
        else
        {
            if (currentNode->box.maxX >= newNode.box.maxX && currentNode->box.minX <= newNode.box.minX && currentNode->box.maxY >= newNode.box.maxY && currentNode->box.minY <= newNode.box.minY)
            {
                // new node is within the bounding box
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode->child[i] != -1)
                        stack.push(currentNode->child[i]);
                }
            }
            else
            {
                // new node is not within the bounding box
                area_maxX = std::max(currentNode->box.maxX, newNode.box.maxX);
                area_maxY = std::max(currentNode->box.maxY, newNode.box.maxY);
                area_minX = std::min(currentNode->box.minX, newNode.box.minX);
                area_minY = std::min(currentNode->box.minY, newNode.box.minY);

                area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - area(currentNode->box);
                std::cout << "Area Enlargement: " << area_enlargement << " Node: " << get_index(currentNode) << std::endl;
                areaEnlargementPair pair = {get_index(currentNode), area_enlargement};
                AreaEnlargementArray[i++] = pair;
            }
        }
    }
    sort(AreaEnlargementArray, i);
}

overlapEnlargementPair OverlapEnlargementArray[MAX];

/**
 * Sorts the nodes in the R-tree by overlap enlargement with a new node.
 *
 * @param newNode The new node to compare with existing nodes.
 */
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
        Node *currentNode = get_node(MAX_LEVELS, nodeIndex);

        // the node being compared to new node is leaf
        maxX = std::min(currentNode->box.maxX, newNode.box.maxX);
        maxY = std::min(currentNode->box.maxY, newNode.box.maxY);
        minX = std::max(currentNode->box.minX, newNode.box.minX);
        minY = std::max(currentNode->box.minY, newNode.box.minY);

        int overlap = (maxX - minX) * (maxY - minY);
        std::cout << "Overlap: " << overlap << " Node: " << nodeIndex << std::endl;
        overlapEnlargementPair pair = {nodeIndex, overlap};
        OverlapEnlargementArray[i++] = pair;
    }
    sort(OverlapEnlargementArray, i);
}

/**
 * Chooses the appropriate subtree for insertion in the R-tree.
 *
 * @param node The node to choose the subtree from.
 * @return The index of the chosen subtree.
 */
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

/**
 * Splits a given node into two new nodes based on a specific splitting algorithm.
 *
 * @param node The node to be split.
 * @return The newly created node after the split.
 */
Node *split(Node *node)
{
    Node *newNode = createNode();
    newNode->leaf = node->leaf;

    boundingBox R1, R2;

    // y-axis = 0, x-axis = 1
    int split_axis = 0, split_edge = 0, split_index = 0, split_margin = 0;

    for (int axis = 0; axis < 2; axis++)
    {
        int margin = 0;
        int overlap = 0, dist_area = INT32_MAX, dist_overlap = INT32_MAX;
        int dist_edge = 0, dist_index = 0;

        // upper edge = 0, lower edge = 1
        for (int edge = 0; edge < 2; edge++)
        {
            if (edge == 0)
                sortItemsByUpperEdge(axis, node);
            else
                sortItemsByLowerEdge(axis, node);

            for (int k = 0; k < MAX_CHILDREN; k++)
            {

                for (int i = 0; i <= k; i++)
                {
                    R1.minX = std::min(R1.minX, getChild(node, i).box.minX);
                    R1.maxX = std::max(R1.maxX, getChild(node, i).box.maxX);
                    R1.minY = std::min(R1.minY, getChild(node, i).box.minY);
                    R1.maxY = std::max(R1.maxY, getChild(node, i).box.maxY);
                }

                for (int i = MAX_CHILDREN - 1 - k; i < MAX_CHILDREN; i++)
                {
                    R2.minX = std::min(R2.minX, getChild(node, i).box.minX);
                    R2.maxX = std::max(R2.maxX, getChild(node, i).box.maxX);
                    R2.minY = std::min(R2.minY, getChild(node, i).box.minY);
                    R2.maxY = std::max(R2.maxY, getChild(node, i).box.maxY);
                }

                int margin = edgeDelta(R1) + edgeDelta(R2);
                int total_area = area(R1) + area(R2);
                int overlap = area(intersection(R1, R2));

                if (overlap < dist_overlap || (overlap == dist_overlap && total_area < dist_area))
                {
                    dist_edge = edge;
                    dist_index = k;
                    dist_overlap = overlap;
                    dist_area = total_area;
                }
            }
        }
        if (split_axis == 1 || split_margin > margin)
        {
            split_axis = axis;
            split_margin = margin;
            split_edge = dist_edge;
            split_index = dist_index;
        }
    }

    if (split_edge == 0)
        sortItemsByUpperEdge(split_axis, node);
    else
        sortItemsByLowerEdge(split_axis, node);

    for (int i = 0; i < split_index; i++)
    {
        while (split_index + i < MAX_CHILDREN)
            newNode->child[i] = node->child[split_index + i];
    }

    for (int i = split_index; i < MAX_CHILDREN; i++)
    {
        node->child[i] = -1;
    }

    updateBoundingBox(node);
    updateBoundingBox(newNode);

    return newNode;
}

Node overflowTreatment(Node *node, bool firstInsert)
{
    if (!equals(node, get_node(MAX_LEVELS, 0)) && firstInsert)
    {
        reinsert(node);
        return Node();
    }

    Node *newNode = split(node);

    // If OverflowTreatment caused a split of the root, create a new root
    if (equals(node, get_node(MAX_LEVELS, 0)))
    {
        Node *newRoot = createNode();
        newRoot->child[0] = 0;
        newRoot->child[1] = currNumNodes;
        add_node(MAX_LEVELS, *newRoot);
        add_node(MAX_LEVELS - 2, *newNode);
        updateBoundingBox(newRoot);
        return *newRoot;
    }

    return *newNode;
}

/**
 * Reinserts the given node into the R-tree.
 *
 * For all M+l entries of a node N, this function computes the distance
 * between the centers of their rectangles and the center of the bounding
 * rectangle of N. It then sorts the entries in decreasing order of their
 * distances. The first p entries are removed from N and the bounding
 * rectangle of N is adjusted. Finally, the removed entries are reinserted
 * into the R-tree.
 *
 * @param node The node to be reinserted.
 */
void reinsert(Node *node)
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
        int key = node->child[i];
        int j = i - 1;
        while (j >= 0 && computeDistCenters(getChild(node, j), *node) > computeDistCenters(hbm_array[key], *node) && node->child[i] != -1)
        {
            node->child[j + 1] = node->child[j];
            j = j - 1;
        }
        node->child[j + 1] = key;
        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            std::cout << "Child " << i << ": " << node->child[i] << std::endl;
        }
    }

    /*
    Remove the first p entries from N and adjust the
    bounding rectangle of N

    In the sort, defined in RI2, starting with the maximum
    distance (= far reinsert) or minimum distance (= close
    reinsert), invoke Insert to reinsert the entries
    */
    insert(getChild(node, 5), false);

    node->child[5] = -1;

    int minX, maxX, minY, maxY;
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (node->child[i] != -1)
        {
            minX = std::min(minX, getChild(node, i).box.minX);
            maxX = std::max(maxX, getChild(node, i).box.maxX);
            minY = std::min(minY, getChild(node, i).box.minY);
            maxY = std::max(maxY, getChild(node, i).box.maxY);
        }
    }

    setBB(node, minX, maxX, minY, maxY);
}

/**
 * Inserts a new node into the R-tree.
 *
 * @param minX The minimum x-coordinate of the node's bounding box.
 * @param maxX The maximum x-coordinate of the node's bounding box.
 * @param minY The minimum y-coordinate of the node's bounding box.
 * @param maxY The maximum y-coordinate of the node's bounding box.
 */
void insert(Node newNode, bool firstInsert = true)
{
    // Node newNode = createLeaf(true, setBB(minX, maxX, minY, maxY));
    // for (int i = 0; i < currNumNodes; i++)
    int count = 0;
    Stack stack;
    stack.push(count); // Start with the root node index

    do
    {
        // int nodeIndex = stack.pop();
        // Node currentNode = nodes[nodeIndex];

        Node *currentNode = get_node(MAX_LEVELS, 0);

        // if is leaf (Lindex = -1)
        // insert node into Lindex
        // else if Rindex = -1
        // insert node into Rindex
        // else
        // insert into stack (choose subtree)
        // update left index / right index of parent node

        if (currentNode->leaf)
        {
            std::cout << "Adding child 0" << std::endl;
            // currentNodeParent = Node();
            currentNode->leaf = false;

            currentNode->child[0] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode); // currNumNodes = array index of newest node, gets updated everytime a node is added
            currNumNodes++;

            updateBoundingBox(currentNode);
        }
        else if (currentNode->child[1] == -1)
        {
            std::cout << "Adding child 1" << std::endl;
            newNode.leaf = 1;

            currentNode->child[1] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode);
            currNumNodes++;

            updateBoundingBox(currentNode);
        }
        else if (currentNode->child[2] == -1)
        {
            std::cout << "Adding child 2" << std::endl;
            newNode.leaf = 1;

            currentNode->child[2] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode);
            currNumNodes++;

            updateBoundingBox(currentNode);
        }
        else if (currentNode->child[3] == -1)
        {
            std::cout << "Adding child 3" << std::endl;
            newNode.leaf = 1;

            currentNode->child[3] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode);
            currNumNodes++;

            updateBoundingBox(currentNode);
        }
        else if (currentNode->child[4] == -1)
        {
            std::cout << "Adding child 4" << std::endl;
            newNode.leaf = 1;

            currentNode->child[4] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode);
            currNumNodes++;

            updateBoundingBox(currentNode);
        }
        else if (currentNode->child[5] == -1)
        {
            std::cout << "Calling OverflowTreatment" << std::endl;
            newNode.leaf = 1;

            currentNode->child[5] = get_index(&newNode);
            add_node(get_level(currentNode) - 1, newNode);
            currNumNodes++;

            updateBoundingBox(currentNode);
            overflowTreatment(currentNode, firstInsert);
        }
        else
        {
            stack.push(chooseSubTree(*currentNode));
        }

    } while (!stack.isEmpty() && count < MAX);
}

/*==================================================== DELETION FUNCTIONS ===============================================================*/

/**
 * Deletes a node from the R-tree.
 *
 * @param node The node to be deleted.
 */
void Remove(Node node, int index)
{
    // if node is leaf
    // remove node from parent
    // if parent has less than m entries
    // reinsert all entries of parent
    // else
    // adjust bounding box of parent
    
}