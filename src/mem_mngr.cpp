#include "mem_mngr.h"

areaEnlargementPair AreaEnlargementArray[MAX];
overlapEnlargementPair OverlapEnlargementArray[MAX];

void memory_manager(
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search,
    hls::stream<Node> &cst2mem,
    hls::stream<int> &mem2cst,
    hls::stream<Node> &insert2mem,
    hls::stream<int> &mem2insert,
    hls::stream<int> &index2mem,
    hls::stream<Node> &overflow2mem,
    hls::stream<Node> &mem2overflow,
    hls::stream<Node> &overflow2reinsert,
    hls::stream<Node> &overflow2split,
    hls::stream<Node> &split2overflow,
    Node *HBM_PTR)
{

    nodes_in_level[0] = 7;
    nodes_in_level[1] = 4;

    if (!search2mem.empty() && !mem2search.full())
    {
        int node_index;
        search2mem.read(node_index);
        std::cout << "Requesting: " << node_index << std::endl;
        mem2search.write(HBM_PTR[node_index]);
        std::cout << "Writing: " << node_index << std::endl;
    }

    if (!cst2mem.empty() && !mem2cst.full())
    {
        Node newNode;
        cst2mem.read(newNode);

        static int i = 0;
        static int area_maxX, area_maxY, area_minX, area_minY;
        static int area_enlargement;
        static int nodeIndex;
        static Node currentNode;
        static Stack stack;
        stack.push(get_level_start_index(H)); // Start with the root node index
        while (!stack.isEmpty())
        {
            nodeIndex = stack.pop();
            currentNode = HBM_PTR[nodeIndex];

            // currentNode is any node in the R-tree
            // newNode is the node being compared to for chooseSubTree
            // basically push any node that is bigger than newNode

            if (!currentNode.leaf && currentNode.box.maxX >= newNode.box.maxX && currentNode.box.minX <= newNode.box.minX && currentNode.box.maxY >= newNode.box.maxY && currentNode.box.minY <= newNode.box.minY)
            {
                // new node is within the bounding box
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode.child[i] != -1)
                    {
                        stack.push(currentNode.child[i]);
                    }
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
                areaEnlargementPair pair = {nodeIndex, area_enlargement};
                AreaEnlargementArray[i++] = pair;
            }
        }
        sort(AreaEnlargementArray, i);

        static int j = 0;
        static int maxX, maxY, minX, minY;
        static Stack stack2;
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            if (AreaEnlargementArray[j].index > -1)
            {
                stack2.push(AreaEnlargementArray[j].index);
            }
        }
        while (!stack2.isEmpty())
        {
            nodeIndex = stack2.pop();
            currentNode = HBM_PTR[nodeIndex];

            // the node being compared to new node is leaf
            maxX = std::min(currentNode.box.maxX, newNode.box.maxX);
            maxY = std::min(currentNode.box.maxY, newNode.box.maxY);
            minX = std::max(currentNode.box.minX, newNode.box.minX);
            minY = std::max(currentNode.box.minY, newNode.box.minY);

            int overlap = (maxX - minX) * (maxY - minY);
            overlapEnlargementPair pair = {nodeIndex, overlap};
            OverlapEnlargementArray[j++] = pair;
        }
        sort(OverlapEnlargementArray, j);

        for (int k = 0; k < j; k++)
        {
            // std::cout << "level of overlap enlargment at " << k << ": " << get_level(OverlapEnlargementArray[k].index) << std::endl;
            if (get_level(OverlapEnlargementArray[k].index) == 1)
            {
                // std::cout << "Found on level 1: " << OverlapEnlargementArray[k].index << std::endl;
                mem2cst.write(OverlapEnlargementArray[k].index);
            }
        }

        if (mem2cst.empty())
        {
            // std::cout << "Found: " << OverlapEnlargementArray[0].index << std::endl;
            mem2cst.write(OverlapEnlargementArray[0].index);
        }

        // clear AreaEnlargementArray and OverlapEnlargementArray
        for (int i = 0; i < MAX; i++)
        {
            AreaEnlargementArray[i].index = 0;
            OverlapEnlargementArray[i].index = 0;
        }
    }

    if (!insert2mem.empty() && !index2mem.empty())
    {
        Node node;
        insert2mem.read(node);
        int insert_index;
        index2mem.read(insert_index);
        Node nodeParent = HBM_PTR[insert_index];
        // std::cout << "Insert index: " << insert_index << std::endl;

        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            if (nodeParent.child[i] == -1)
            {
                int childLevel = get_level(insert_index) - 1;
                std::cout << "child level: " << childLevel << std::endl;
                int node_index = nodes_in_level[childLevel];
                std::cout << "node_index: " << node_index << std::endl;
                if (node_index >= MAX_NODES_PER_LEVEL)
                {
                    printf("Error: Level %d is full.\n", childLevel);
                    return;
                }
                int start_index = get_level_start_index(childLevel);
                std::cout << "start index: " << start_index << std::endl;
                HBM_PTR[start_index + node_index] = node;
                nodeParent.child[i] = start_index + node_index;
                nodes_in_level[childLevel]++;
                std::cout << "Inserting node at index: " << start_index + node_index << std::endl;
                break;
            }
        }

        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            std::cout << "Child " << i << ": " << nodeParent.child[i] << std::endl;
        }

        if (nodeParent.child[5] == -1)
        {
            // std::cout << "writing to mem2insert" << std::endl;
            mem2insert.write(1);
        }
        else
        {
            // std::cout << "writing to overflow2mem" << std::endl;
            overflow2mem.write(node);
        }
    }

    // if (!overflow2mem.empty())
    // {
    //     Node node;
    //     overflow2mem.read(node);

    //     if (!equals(node, HBM_PTR[get_level_start_index(H)]))
    //     {
    //         std::cout << "Reinserting node" << std::endl;
    //         overflow2reinsert.write(node);
    //     }

    //     overflow2split.write(node);

    //     if (!split2overflow.empty())
    //     {
    //         Node newNode;
    //         split2overflow.read(newNode);

    //         // If OverflowTreatment caused a split of the root, create a new root
    //         if (!equals(node, HBM_PTR[get_level_start_index(H)]))
    //         {
    //             std::cout << "Creating new root" << std::endl;
    //             Node newRoot;

    //             std::cout << "Set Child 0" << std::endl;
    //             // set_child(newRoot, 0, get_index(node));
    //             newRoot.child[0] = get_level_start_index(H);

    //             std::cout << "Set Child 1" << std::endl;
    //             // set_child(newRoot, 1, get_index(node) + 1);
    //             newRoot.child[1] = get_level_start_index(H) + 1;

    //             std::cout << "Increase height" << std::endl;
    //             increase_height();
    //             std::cout << "Increased height: " << H << std::endl;

    //             std::cout << "Add new root" << std::endl;
    //             // add_node(H, *newRoot);
    //             HBM_PTR[H * MAX_NODES_PER_LEVEL] = newRoot;

    //             std::cout << "Add new node" << std::endl;
    //             // add_node(H - 1, newNode);
    //             HBM_PTR[(H - 1) * MAX_NODES_PER_LEVEL + nodes_in_level[H - 1]] = newNode;

    //             std::cout << "Updated bounding box" << std::endl;
    //             updateBoundingBox(newRoot);

    //             // return newRoot;
    //             mem2overflow.write(newRoot);
    //         }

    //         // return newNode;
    //         mem2overflow.write(newNode);
    //     }
    // }

    // if (!overflow2reinsert.empty())
    // {
    //     Node node;
    //     overflow2reinsert.read(node);

    //     /*
    //     For all M+l entries of a node N, compute the distance
    //     between the centers of their rectangles and the center
    //     of the bounding rectangle of N

    //     Sort the entries in decreasing order of their distances
    //     computed in RI1
    //     */
    //     for (int i = 1; i < MAX_CHILDREN; i++)
    //     {
    //         int key = node.child[i];
    //         int j = i - 1;
    //         while (j >= 0 && computeDistCenters(HBM_PTR[node.child[j]], node) > computeDistCenters(HBM_PTR[key], node) && node.child[i] != -1)
    //         {
    //             // set_child(node, j + 1, get_child(node, j));
    //             node.child[j + 1] = node.child[j];
    //             j = j - 1;
    //         }
    //         // set_child(node, j + 1, key);
    //         node.child[j + 1] = key;
    //         for (int i = 0; i < MAX_CHILDREN; i++)
    //         {
    //             std::cout << "Child " << i << ": " << node.child[i] << std::endl;
    //         }
    //     }

    //     /*
    //     Remove the first p entries from N and adjust the
    //     bounding rectangle of N

    //     In the sort, defined in RI2, starting with the maximum
    //     distance (= far reinsert) or minimum distance (= close
    //     reinsert), invoke Insert to reinsert the entries
    //     */
    //     // insert(getChild(node, 5), false);
    //     insert2mem.write(HBM_PTR[node.child[5]]);

    //     // set_child(node, 5, -1);
    //     node.child[5] = -1;

    //     updateBoundingBox(node);
    // }

    // if (!overflow2split.empty())
    // {
    //     Node node;
    //     overflow2split.read(node);
    //     Node newNode;
    //     newNode.leaf = node.leaf;

    //     boundingBox R1;
    //     boundingBox R2;

    //     int split_axis = 0, split_edge = 0, split_index = 0;
    //     int split_margin = INT_MAX;
    //     int dist_overlap = INT_MAX;
    //     int dist_area = INT_MAX;

    //     for (int axis = 0; axis < 2; axis++)
    //     {
    //         for (int edge = 0; edge < 2; edge++)
    //         {
    //             if (edge == 0)
    //                 sortItemsByUpperEdge(axis, node);
    //             else
    //                 sortItemsByLowerEdge(axis, node);

    //             for (int k = 0; k < MAX_CHILDREN; k++)
    //             {
    //                 boundingBox tempR1 = setBB(INT_MAX, INT_MIN, INT_MAX, INT_MIN);
    //                 boundingBox tempR2 = setBB(INT_MAX, INT_MIN, INT_MAX, INT_MIN);

    //                 for (int i = 0; i <= k; i++)
    //                 {
    //                     Node child = HBM_PTR[node.child[i]];
    //                     tempR1.minX = std::min(tempR1.minX, child.box.minX);
    //                     tempR1.maxX = std::max(tempR1.maxX, child.box.maxX);
    //                     tempR1.minY = std::min(tempR1.minY, child.box.minY);
    //                     tempR1.maxY = std::max(tempR1.maxY, child.box.maxY);
    //                 }

    //                 for (int i = k + 1; i < MAX_CHILDREN; i++)
    //                 {
    //                     Node child = HBM_PTR[node.child[i]];
    //                     tempR2.minX = std::min(tempR2.minX, child.box.minX);
    //                     tempR2.maxX = std::max(tempR2.maxX, child.box.maxX);
    //                     tempR2.minY = std::min(tempR2.minY, child.box.minY);
    //                     tempR2.maxY = std::max(tempR2.maxY, child.box.maxY);
    //                 }

    //                 int margin = edgeDelta(tempR1) + edgeDelta(tempR2);
    //                 int total_area = area(tempR1) + area(tempR2);
    //                 int overlap = area(intersection(tempR1, tempR2));

    //                 if (overlap < dist_overlap || (overlap == dist_overlap && total_area < dist_area))
    //                 {
    //                     split_axis = axis;
    //                     split_margin = margin;
    //                     split_edge = edge;
    //                     split_index = k;
    //                 }
    //             }
    //         }
    //     }

    //     if (split_edge == 0)
    //         sortItemsByUpperEdge(split_axis, node);
    //     else
    //         sortItemsByLowerEdge(split_axis, node);

    //     for (int i = 0; i <= split_index; i++)
    //     {
    //         // set_child(&newNode, i, get_child(node, split_index + i));
    //         newNode.child[i] = get_child(node, split_index + i);
    //         // set_child(node, split_index + i, -1);
    //         node.child[split_index + i] = -1;
    //     }

    //     for (int i = split_index + 1; i < MAX_CHILDREN; i++)
    //     {
    //         // set_child(node, i, -1);
    //         node.child[i] = -1;
    //     }

    //     updateBoundingBox(node);
    //     updateBoundingBox(newNode);

    //     // return newNode;
    //     split2overflow.write(newNode);
    // }
}