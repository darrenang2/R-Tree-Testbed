#include "helper.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include "climits"
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
int *search(int minX, int maxX, int minY, int maxY, int *output)
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
                if (get_child(currentNode, i) != -1)
                {
                    Node *childNode = get_node(get_child(currentNode, i));
                    // printNode(childNode);
                    if (childNode->box.minX <= maxX && childNode->box.maxX >= minX && childNode->box.minY <= maxY && childNode->box.maxY >= minY)
                    {
                        std::cout << "Pushing child " << i << std::endl;
                        stack.push(get_child(currentNode, i)); // Push child node to stack
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

        std::cout << "Current Node: " << std::endl;
        printNode(currentNode);

        std::cout << "New Node: " << std::endl;
        printNode(&newNode);

        // currentNode is any node in the R-tree
        // newNode is the node being compared to for chooseSubTree
        // basically push any node that is bigger than newNode

        if (!currentNode->leaf && currentNode->box.maxX >= newNode.box.maxX && currentNode->box.minX <= newNode.box.minX && currentNode->box.maxY >= newNode.box.maxY && currentNode->box.minY <= newNode.box.minY)
        {
            // new node is within the bounding box
            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                if (get_child(currentNode, i) != -1)
                {
                    std::cout << "Area Enlargement Push: ";
                    stack.push(get_child(currentNode, i));
                }
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
        if (AreaEnlargementArray[i].index > 0)
        {
            std::cout << "Overlap Enlargement Push: ";
            stack.push(AreaEnlargementArray[i].index);
        }
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
        std::cout << "Area Enlargement Array at " << i << ": " << AreaEnlargementArray[i].index << std::endl;
    }

    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        std::cout << "Overlap Enlargement Array at " << i << ": " << OverlapEnlargementArray[i].index << std::endl;
    }

    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (get_level(get_node(AreaEnlargementArray[i].index)) == 1)
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
    int split_margin = INT_MAX;
    int dist_overlap = INT_MAX;
    int dist_area = INT_MAX;

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
                boundingBox tempR1 = setBB(INT_MAX, INT_MIN, INT_MAX, INT_MIN);
                boundingBox tempR2 = setBB(INT_MAX, INT_MIN, INT_MAX, INT_MIN);

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
        set_child(&newNode, i, get_child(node, split_index + i));
        set_child(node, split_index + i, -1);
    }

    for (int i = split_index + 1; i < MAX_CHILDREN; i++)
    {
        set_child(node, i, -1);
    }

    updateBoundingBox(node);
    updateBoundingBox(&newNode);

    return newNode;
}

Node overflowTreatment(Node *node, bool firstInsert)
{
    if (get_level(node) != H && firstInsert)
    {
        std::cout << "Reinserting node" << std::endl;
        reinsert(node);
        return Node();
    }

    Node newNode = split(node);

    // If OverflowTreatment caused a split of the root, create a new root
    if (get_level(node) == H)
    {
        std::cout << "Creating new root" << std::endl;
        Node *newRoot;

        std::cout << "Set Child 0" << std::endl;
        set_child(newRoot, 0, get_index(node));

        std::cout << "Set Child 1" << std::endl;
        set_child(newRoot, 1, get_index(node) + 1);

        std::cout << "Increase height" << std::endl;
        increase_height();
        std::cout << "Increased height: " << H << std::endl;

        std::cout << "Add new root" << std::endl;
        add_node(H, *newRoot);

        std::cout << "Add new node" << std::endl;
        add_node(H - 1, newNode);

        std::cout << "Updated bounding box" << std::endl;
        updateBoundingBox(newRoot);

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
        int key = get_child(node, i);
        int j = i - 1;
        while (j >= 0 && computeDistCenters(getChild(node, j), node) > computeDistCenters(get_node(key), node) && get_child(node, i) != -1)
        {
            set_child(node, j + 1, get_child(node, j));
            j = j - 1;
        }
        set_child(node, j + 1, key);
        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            std::cout << "Child " << i << ": " << get_child(node, i) << std::endl;
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

    set_child(node, 5, -1);

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
void insert(Node *newNode, bool firstInsert)
{
    std::cout << "calling insert" << std::endl;
    int index = chooseSubTree(*newNode);

    // clear AreaEnlargementArray and OverlapEnlargementArray
    for (int i = 0; i < MAX; i++)
    {
        AreaEnlargementArray[i].index = 0;
        OverlapEnlargementArray[i].index = 0;
    }

    std::cout << "Chosen subtree: " << index << std::endl;
    Node *node = get_node(index);
    printNode(node);

    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (get_child(node, i) == -1)
        {
            std::cout << "Inserting at index: " << i << std::endl;
            set_child(node, i, get_index(newNode));
            break;
        }
    }

    if (get_child(node, 5) != -1)
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

    // NODE LEVEL
    int ind = get_level_start_index(level) + index;
    Node *node = get_node(level, index);

    // PARENT LEVEL
    int parent_level = level + 1;
    int parent_num_nodes = nodes_in_level[parent_level];

    std::cout << "Parent Level: " << parent_level << std::endl;
    std::cout << "Parent Num Nodes: " << parent_num_nodes << std::endl;

    if (node->leaf)
    {
        for (int i = 0; i < MAX_NODES_PER_LEVEL; i++)
        {
            Node *parentNode = get_node(parent_level, i);
            for (int j = 0; j < MAX_CHILDREN; j++)
            {
                if (get_child(parentNode, j) == ind)
                {
                    set_child(parentNode, j, -1);
                    updateBoundingBox(parentNode);
                    delete_node(level, index);
                    return;
                }
            }
        }
    }
    else
    {
        int children[MAX_CHILDREN];
        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            children[i] = get_child(node, i);
            std::cout << "Child " << i << ": " << children[i] << std::endl;
        }

        for (int i = 0; i < MAX_NODES_PER_LEVEL; i++)
        {
            Node *parentNode = get_node(parent_level, i);
            for (int j = 0; j < MAX_CHILDREN; j++)
            {
                if (get_child(parentNode, j) == ind)
                {
                    std::cout << "Deleting node: " << ind << std::endl;
                    set_child(parentNode, j, -1);
                    printNode(parentNode);
                    updateBoundingBox(parentNode);
                    printNode(parentNode);
                    delete_node(level, index);
                    continue;
                }
            }
        }

        Stack stack;

        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            if (children[i] != -1)
            {
                std::cout << "Inital Push child: " << i << std::endl;
                stack.push(children[i]);
            }
        }

        while (!stack.isEmpty())
        {
            int child_index = stack.pop();
            Node *child = get_node(child_index);
            insert(child, true);
            for (int i = 0; i < MAX_CHILDREN; i++)
            {
                if (!child->leaf && get_child(child, i) != -1)
                {
                    std::cout << "Secondary Push child: " << i << std::endl;
                    stack.push(get_child(child, i));
                }
            }
            delete_node(child_index);
        }
    }
}