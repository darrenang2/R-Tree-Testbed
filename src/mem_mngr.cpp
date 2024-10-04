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
    Node *HBM_PTR)
{
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
            if (get_level(HBM_PTR + AreaEnlargementArray[i].index) == 1)
            {
                // std::cout << "Found: " << AreaEnlargementArray[i].index << std::endl;
                mem2cst.write(OverlapEnlargementArray[i].index);
            }
        }

        if (mem2cst.empty())
        {
            // std::cout << "Found: " << AreaEnlargementArray[0].index << std::endl;
            mem2cst.write(AreaEnlargementArray[0].index);
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

        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            if (node.child[i] == -1)
            {
                node.child[i] = insert_index;
                HBM_PTR[insert_index] = node;
                break;
            }
        }

        if (node.child[5] != -1)
        {
            mem2insert.write(1);
        }
        else
        {
            mem2insert.write(2);
        }
    }
}