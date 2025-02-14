#include "krnlSearch.h"

void search(
    hls::stream<boundingBox> &searchInput,
    hls::stream<data_t> &searchOutput,
    hls::stream<int> &search2mem,
    hls::stream<Node> &mem2search)
{
    enum SearchStates
    {
        INIT,
        POP,
        GET_NODE,
        PUSH,
        FOUND
    };
    static SearchStates state = INIT;

    boundingBox find;
    static Stack stack;
    static int rt = 0;
    static int ch = 0;
    static int pushIndex = 0;
    Node currentNode;
    static int nodeIndex;
    // Max size
    static data_t found[1000];
    static data_t child[10];

    switch (state)
    {
    case INIT:
    {
        //std::cout << "STATE: INIT" << std::endl;
        if (!searchInput.empty())
        {
            searchInput.read(find);
            stack.push(get_level_start_index(H));
            std::cout << "Search: " << find.minX << " " << find.maxX << " " << find.minY << " " << find.maxY << std::endl;
            state = POP;
        }
        break;
    }

    case POP:
    {
        std::cout << "STATE: POP" << std::endl;
        if (!stack.isEmpty() && !search2mem.full())
        {
            nodeIndex = stack.pop();
            std::cout << "node index: " << nodeIndex << std::endl;
            search2mem.write(nodeIndex);
            state = GET_NODE;
        }
        else
        {
            state = FOUND;
        }
        break;
    }

    case GET_NODE:
    {
        if (!mem2search.empty())
        {
            state = POP;
            std::cout << "STATE: GET_NODE" << std::endl;
            mem2search.read(currentNode);
            if (currentNode.hasLeaves)
            {
                std::cout << "Leaf Node: " << nodeIndex << std::endl;
                if (currentNode.box.minX <= find.maxX && currentNode.box.maxX >= find.minX &&
                    currentNode.box.minY <= find.maxY && currentNode.box.maxY >= find.minY)
                {
                    std::cout << "Adding Leaf Node to Found: " << nodeIndex << std::endl;
                    found[rt++] = nodeIndex; // Node index matches search criteria
                }
            }
            else
            {
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode.child[i] != -1)
                    {
                        search2mem.write(currentNode.child[i]);
                        child[ch++] = currentNode.child[i];
                        state = PUSH;
                    }
                }
            }
        }

        break;
    }

    case PUSH:
    {
        std::cout << "STATE: PUSH" << std::endl;
        if (!mem2search.empty())
        {
            mem2search.read(currentNode);
            std::cout << "Current Node: " << currentNode.box.minX << " " << currentNode.box.maxX << " " << currentNode.box.minY << " " << currentNode.box.maxY << std::endl;
            if (currentNode.box.minX <= find.maxX && currentNode.box.maxX >= find.minX && currentNode.box.minY <= find.maxY && currentNode.box.maxY >= find.minY)
            {
                std::cout << "Pushing Child: " << child[pushIndex] << std::endl;
                stack.push(child[pushIndex++]); // Push child node to stack
            }
            else
            {
                pushIndex++;
            }
            if (stack.isEmpty())
            {
                state = FOUND;
            }
            else if (pushIndex == ch)
            {
                pushIndex = 0;
                ch = 0;
                state = POP;
            }
        }
        break;
    }

    case FOUND:
    {
        std::cout << "STATE: FOUND" << std::endl;
        for (int i = 0; i < rt; i++)
        {
            searchOutput.write(found[i]); // Write found nodes
            if (rt < 0)
            {
                state = INIT;
            }
        }
        break;
    }
    }
}