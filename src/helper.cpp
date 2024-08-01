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
data_t *search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
    std::cout << "R-Tree Search: (" << minX << "->" << maxX << ")(" << minY << "->" << maxY << ")" << std::endl;
    // Return counter;
    int rt = 0;

    Stack stack;
    stack.push(get_level_start_index(H)); // Start with the root node index

    while (!stack.isEmpty())
    {
        // int nodeIndex = stack.pop();         // Get the top node from the stack
        // Node currentNode = nodes[nodeIndex]; // Get the current node

        // print_level(H);
        int nodeIndex = stack.pop();
        std::cout << "node index: " << nodeIndex << std::endl;
        Node *currentNode = get_node(nodeIndex);
        printNode(currentNode);

        // Check if current node overlaps with search range
        if (currentNode->leaf)
        {
            std::cout << "Leaf Node: " << nodeIndex << std::endl;
            if (currentNode->box.minX <= maxX && currentNode->box.maxX >= minX && currentNode->box.minY <= maxY && currentNode->box.maxY >= minY)
            {
                output[rt++] = nodeIndex; // Node index matches search criteria
            }
        }
        else
        {
            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                if (currentNode->child[i] != -1)
                {
                    Node *childNode = get_node(currentNode->child[i]);
                    // printNode(childNode);
                    if (childNode->box.minX <= maxX && childNode->box.maxX >= minX && childNode->box.minY <= maxY && childNode->box.maxY >= minY)
                    {
                        std::cout << "Pushing child " << i << std::endl;
                        stack.push(currentNode->child[i]); // Push child node to stack
                    }
                }
            }
        }
    }
    std::cout << "Number of leaves with overlap: " << rt << std::endl;
    std::cout << "Output: ";
    for (int i = 0; i < rt; i++)
    {
        std::cout << output[i] << ", ";
    }
    return output;
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
    stack.push(get_level_start_index(H)); // Start with the root node index
    while (!stack.isEmpty())
    {
        // int nodeIndex = stack.pop();
        // Node currentNode = nodes[nodeIndex];

        int nodeIndex = stack.pop();
        Node *currentNode = get_node(nodeIndex);

        if (!currentNode->leaf && currentNode->box.maxX >= newNode.box.maxX && currentNode->box.minX <= newNode.box.minX && currentNode->box.maxY >= newNode.box.maxY && currentNode->box.minY <= newNode.box.minY)
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
            std::cout << "Area Enlargement: " << area_enlargement << " Node: " << nodeIndex << std::endl;
            areaEnlargementPair pair = {nodeIndex, area_enlargement};
            AreaEnlargementArray[i++] = pair;
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
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        stack.push(AreaEnlargementArray[i].index);
    }
    while (!stack.isEmpty())
    {
        int nodeIndex = stack.pop();
        Node *currentNode = get_node(nodeIndex);

        // the node being compared to new node is leaf
        maxX = std::min(currentNode->box.maxX, newNode.box.maxX);
        maxY = std::min(currentNode->box.maxY, newNode.box.maxY);
        minX = std::max(currentNode->box.minX, newNode.box.minX);
        minY = std::max(currentNode->box.minY, newNode.box.minY);

        int overlap = (maxX - minX) * (maxY - minY);
        std::cout << "Overlap: " << overlap << " Index: " << nodeIndex << std::endl;
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

    // return a node in the level above the leaves

    sortByAreaEnlargement(node);
    sortByOverlapEnlargement(node);

    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (!get_node(OverlapEnlargementArray[i].index)->leaf)
        {
            return OverlapEnlargementArray[i].index;
        }
    }

    return AreaEnlargementArray[0].index;
}

/**
 * Splits a given node into two new nodes based on a specific splitting algorithm.
 *
 * @param node The node to be split.
 * @return The newly created node after the split.
 */
Node split(Node *node)
{
    std::cout << "Calling Split" << std::endl;

    Node newNode;
    newNode.leaf = node->leaf;

    boundingBox R1;
    boundingBox R2;

    int split_axis = 0, split_edge = 0, split_index = 0;
    int split_margin = std::numeric_limits<int>::max();
    int dist_overlap = std::numeric_limits<int>::max();
    int dist_area = std::numeric_limits<int>::max();

    for (int axis = 0; axis < 2; axis++)
    {
        for (int edge = 0; edge < 2; edge++)
        {
            if (edge == 0)
                sortItemsByUpperEdge(axis, node);
            else
                sortItemsByLowerEdge(axis, node);

            for (int k = 0; k < MAX_CHILDREN; k++)
            {
                boundingBox tempR1 = {std::numeric_limits<int>::max(), std::numeric_limits<int>::min(),
                                      std::numeric_limits<int>::max(), std::numeric_limits<int>::min()};
                boundingBox tempR2 = {std::numeric_limits<int>::max(), std::numeric_limits<int>::min(),
                                      std::numeric_limits<int>::max(), std::numeric_limits<int>::min()};

                for (int i = 0; i <= k; i++)
                {
                    Node *child = getChild(node, i);
                    tempR1.minX = std::min(tempR1.minX, child->box.minX);
                    tempR1.maxX = std::max(tempR1.maxX, child->box.maxX);
                    tempR1.minY = std::min(tempR1.minY, child->box.minY);
                    tempR1.maxY = std::max(tempR1.maxY, child->box.maxY);
                }

                for (int i = k + 1; i < MAX_CHILDREN; i++)
                {
                    Node *child = getChild(node, i);
                    tempR2.minX = std::min(tempR2.minX, child->box.minX);
                    tempR2.maxX = std::max(tempR2.maxX, child->box.maxX);
                    tempR2.minY = std::min(tempR2.minY, child->box.minY);
                    tempR2.maxY = std::max(tempR2.maxY, child->box.maxY);
                }

                int margin = edgeDelta(tempR1) + edgeDelta(tempR2);
                int total_area = area(tempR1) + area(tempR2);
                int overlap = area(intersection(tempR1, tempR2));

                if (overlap < dist_overlap || (overlap == dist_overlap && total_area < dist_area))
                {
                    split_axis = axis;
                    split_margin = margin;
                    split_edge = edge;
                    split_index = k;
                }
            }
        }
    }

    if (split_edge == 0)
        sortItemsByUpperEdge(split_axis, node);
    else
        sortItemsByLowerEdge(split_axis, node);

    for (int i = 0; i <= split_index; i++)
    {
        newNode.child[i] = node->child[split_index + i];
        node->child[split_index + i] = -1;
    }

    for (int i = split_index + 1; i < MAX_CHILDREN; i++)
    {
        node->child[i] = -1;
    }

    updateBoundingBox(node);
    updateBoundingBox(&newNode);

    return newNode;
}

Node overflowTreatment(Node *node, bool firstInsert)
{
    if (!equals(node, get_node(H, 0)) && firstInsert)
    {
        reinsert(node);
        return Node();
    }

    Node newNode = split(node);

    // If OverflowTreatment caused a split of the root, create a new root
    if (equals(node, get_node(H, 0)))
    {
        Node *newRoot = createNode();
        newRoot->child[0] = get_index(node);
        newRoot->child[1] = get_index(node) + 1;
        increase_height(1);
        add_node(H, *newRoot);
        add_node(H - 1, newNode);
        updateBoundingBox(newRoot);
        set_node(H, 0, *newRoot);
        return *newRoot;
    }

    return newNode;
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

    Sort the entries in decreasing order of their distances
    computed in RI1
    */
    for (int i = 1; i < MAX_CHILDREN; i++)
    {
        int key = node->child[i];
        int j = i - 1;
        while (j >= 0 && computeDistCenters(getChild(node, j), node) > computeDistCenters(get_node(key), node) && node->child[i] != -1)
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
    insert(*getChild(node, 5), false);

    node->child[5] = -1;

    updateBoundingBox(node);
}

/**
 * Inserts a new node into the R-tree.
 *
 * @param minX The minimum x-coordinate of the node's bounding box.
 * @param maxX The maximum x-coordinate of the node's bounding box.
 * @param minY The minimum y-coordinate of the node's bounding box.
 * @param maxY The maximum y-coordinate of the node's bounding box.
 */
void insert(Node newNode, bool firstInsert)
{
    std::cout << "calling insert" << std::endl;
    int index = chooseSubTree(newNode);
    std::cout << "Chosen subtree: " << index << std::endl;
    Node *node = get_node(index);
    printNode(node);

    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (node->child[i] == -1)
        {
            std::cout << "Inserting at index: " << i << std::endl;
            node->child[i] = get_index(&newNode);
            break;
        }
    }

    if (node->child[5] != -1)
    {
        std::cout << "Overflow Treatment" << std::endl;
        overflowTreatment(node, firstInsert);
    }
}

/*==================================================== DELETION FUNCTIONS ===============================================================*/

/**
 * Deletes a node from the R-tree.
 *
 * @param node The node to be deleted.
 * @param index The index of the node to be deleted.
 */
void remove(int level, int index)
{
    // if node is leaf
    // delete node and remove node from parent
    // update bounding box of parent
    // if parent has less than m children, reinsert children and parent node?

    // else (intermediate node)
    // delete node from parent of intermediate node
    // delete node and reinsert all nodes underneath it
    // update bounding box of parent

    Node *node = get_node(level, index);

    if (node->leaf)
    {
        delete_node(level, index);
        int num_nodes = nodes_in_level[level + 1];
        for (int i = 0; i < num_nodes; i++)
        {
            Node *parent = get_node(level + 1, i);
            updateBoundingBox(parent);
        }
    }
}