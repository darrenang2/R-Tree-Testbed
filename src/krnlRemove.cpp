#include "krnlRemove.h"

void remove(hls::stream<int> &removeInputLevel,
            hls::stream<int> &removeInputIndex,
            hls::stream<int> &removeLevel2mem,
            hls::stream<int> &removeIndex2mem,
            hls::stream<int> &mem2removeLevel,
            hls::stream<int> &mem2removeIndex,
            hls::stream<Node> &mem2node,
            hls::stream<Node> &mem2overflow,
            hls::stream<Node> &overflow2mem,
            Node *HBM_PTR)
{
    enum RemoveStates
    {
        INIT,
        POP,
        GET_NODE,
        PUSH,
        FOUND
    };
    static RemoveStates state = INIT;

    static Stack stack;
    static int rt = 0;
    static int ch = 0;
    static int pushIndex = 0;
    Node currentNode;
    static int nodeIndex;
    static int removeLevel;
    static int removeIndex;
    static int child[MAX_CHILDREN];
    static int removeChild[MAX_CHILDREN];

    switch (state)
    {
    case INIT:
    {
        std::cout << "STATE: INIT" << std::endl;
        if (!removeInputLevel.empty() && !removeInputIndex.empty())
        {
            removeInputLevel.read(removeLevel);
            removeInputIndex.read(removeIndex);
            stack.push(get_level_start_index(removeLevel));
            std::cout << "Remove: " << removeLevel << " " << removeIndex << std::endl;
            state = POP;
        }
        break;
    }

    case POP:
    {
        std::cout << "STATE: POP" << std::endl;
        if (!stack.isEmpty() && !removeLevel2mem.full())
        {
            nodeIndex = stack.pop();
            std::cout << "node index: " << nodeIndex << std::endl;
            removeLevel2mem.write(nodeIndex);
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
        std::cout << "STATE: GET_NODE" << std::endl;
        if (!mem2node.empty())
        {
            mem2node.read(currentNode);
            if (currentNode.leaf)
            {
                std::cout << "Leaf Node: " << nodeIndex << std::endl;
                if (currentNode.child[0] == removeIndex)
                {
                    std::cout << "Removing Leaf Node: " << nodeIndex << std::endl;
                    for (int i = 0; i < MAX_CHILDREN; i++)
                    {
                        currentNode.child[i] = -1;
                    }
                    mem2removeLevel.write(removeLevel);
                    mem2removeIndex.write(removeIndex);
                }
            }
            else
            {
                for (int i = 0; i < MAX_CHILDREN; i++)
                {
                    if (currentNode.child[i] != -1)
                    {
                        removeLevel2mem.write(currentNode.child[i]);
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
        if (!removeLevel2mem.empty())
        {
            removeLevel2mem.read(pushIndex);
            stack.push(pushIndex);
            state = POP;
        }
        break;
    }

    case FOUND:
    {
        std::cout << "STATE: FOUND" << std::endl;
        break;
    }
    }
}