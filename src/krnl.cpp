#include "constants.h"
#include <float.h>
#include <iostream>
#include <algorithm>

/*==================================================== NODE STRUCTURE ===============================================================*/

struct Node
{
    bool leaf = 0;
    // If leaf node
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;

    // Intermiate Nodes
    int LminX = 0;
    int LmaxX = 0;
    int LminY = 0;
    int LmaxY = 0;

    int RminX = 0;
    int RmaxX = 0;
    int RminY = 0;
    int RmaxY = 0;

    int Lindex = -1;
    int Rindex = -1;

    Node(bool l, int x1, int x2, int y1, int y2)
        : leaf(l), minX(x1), maxX(x2), minY(y1), maxY(y2) {}

    Node(bool l, int lx1, int lx2, int ly1, int ly2, int rx1, int rx2, int ry1, int ry2, int li, int ri)
        : leaf(l), LminX(lx1), LmaxX(lx2), LminY(ly1), LmaxY(ly2), RminX(rx1), RmaxX(rx2), RminY(ry1), RmaxY(ry2), Lindex(li), Rindex(ri) {}

    Node()
        : leaf(false) {}

    int area()
    {
        return (maxX - minX) * (maxY - minY);
    }
};

struct boundingBox
{
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;
};

boundingBox calculateBoundingBox(Node node)
{
    boundingBox box;
    box.minX = std::min(node.LminX, node.RminX);
    box.maxX = std::max(node.LmaxX, node.RmaxX);
    box.minY = std::min(node.LminY, node.RminY);
    box.maxY = std::max(node.LmaxY, node.RmaxY);
    return box;
}

bool overlap(Node node1, Node node2)
{
    return (node1.minX <= node2.maxX && node1.maxX >= node2.minX && node1.minY <= node2.maxY && node1.maxY >= node2.minY);
}

bool overlap(boundingBox box, Node node)
{
    return (box.minX <= node.maxX && box.maxX >= node.minX && box.minY <= node.maxY && box.maxY >= node.minY);
}

bool overlap(boundingBox box1, boundingBox box2)
{
    return (box1.minX <= box2.maxX && box1.maxX >= box2.minX && box1.minY <= box2.maxY && box1.maxY >= box2.minY);
}

/*==================================================== INITIALIZE DATA ===============================================================*/

#define MAX 100             // Max number of nodes
#define INT_MAX 2147483647; // Max integer value
#define MAX_LEAVES 2;       // Max number of leaves in a node

int currNumNodes = 7; // Number of Nodes
const int numNodes = MAX;
Node nodes[numNodes];

/*==================================================== STACK FUNCTIONS ===============================================================*/

int top = -1;
int a[MAX];

bool push(int x)
{
    if (top >= (MAX - 1))
    {
        std::cout << "Stack Overflow";
        return false;
    }
    else
    {
        a[++top] = x;
        std::cout << x << " pushed into stack\n";
        return true;
    }
}

int pop()
{
    if (top < 0)
    {
        std::cout << "Stack Underflow";
        return 0;
    }
    else
    {
        int x = a[top--];
        return x;
    }
}

int peek()
{
    if (top < 0)
    {
        std::cout << "Stack is Empty";
        return 0;
    }
    else
    {
        int x = a[top];
        return x;
    }
}

bool isEmpty()
{
    return (top < 0);
}

/*==================================================== SEARCH FUNCTIONS ===============================================================*/

int search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
    std::cout << "R-Tree Search: (" << minX << "->" << maxX << ")(" << minY << "->" << maxY << ")" << std::endl;
    // Return counter;
    int rt = 0;

    push(0); // Start with the root node index

    while (!isEmpty())
    {
        int nodeIndex = pop();               // Get the top node from the stack
        Node currentNode = nodes[nodeIndex]; // Get the current node

        // Check if current node overlaps with search range
        if (currentNode.leaf)
        {
            if (currentNode.minX <= maxX && currentNode.maxX >= minX && currentNode.minY <= maxY && currentNode.maxY >= minY)
            {
                output[rt++] = nodeIndex; // Node index matches search criteria
            }
        }
        else
        {
            // If not a leaf node, check if it overlaps with search range
            if (currentNode.LminX <= maxX && currentNode.LmaxX >= minX && currentNode.LminY <= maxY && currentNode.LmaxY >= minY)
            {
                push(currentNode.Lindex); // Push left child node to stack
            }
            if (currentNode.RminX <= maxX && currentNode.RmaxX >= minX && currentNode.RminY <= maxY && currentNode.RmaxY >= minY)
            {
                push(currentNode.Rindex); // Push right child node to stack
            }
        }
    }
    std::cout << "Number of nodes with overlap: " << rt << std::endl;
    return rt;
}

/*==================================================== SPLIT FUNCTIONS ===============================================================*/

int sortedArray[MAX];

void sortByArea()
{
    for (int i = 0; i < numNodes; i++)
    {
        sortedArray[i] = nodes[i].area();
    }

    int i, j;
    bool swapped;
    for (i = 0; i < numNodes - 1; i++)
    {
        swapped = false;
        for (j = 0; j < numNodes - i - 1; j++)
        {
            if (sortedArray[j] > sortedArray[j + 1])
            {
                std::swap(sortedArray[j], sortedArray[j + 1]);
                swapped = true;
            }
        }
        // If no two elements were swapped by inner loop, then break
        if (swapped == false)
            break;
    }

    for (int i = 0; i < numNodes; i++)
    {
        nodes[i] = nodes[sortedArray[i]];
    }
}

void split(int nodeIndex, Node currentNode, Node newNode)
{
    // Choose the best pair of nodes to split
    int bestPair[2];
    int bestArea = INT_MAX;
    for (int i = 0; i < currNumNodes; i++)
    {
        for (int j = i + 1; j < currNumNodes; j++)
        {
            int area = (nodes[i].maxX - nodes[i].minX) * (nodes[i].maxY - nodes[i].minY) + (nodes[j].maxX - nodes[j].minX) * (nodes[j].maxY - nodes[j].minY);
            if (area < bestArea)
            {
                bestArea = area;
                bestPair[0] = i;
                bestPair[1] = j;
            }
        }
    }

    // Split the best pair of nodes
    Node L = nodes[bestPair[0]];
    Node R = nodes[bestPair[1]];

    // Update the current node
    currentNode.LminX = L.minX;
    currentNode.LmaxX = L.maxX;
    currentNode.LminY = L.minY;
    currentNode.LmaxY = L.maxY;
    currentNode.RminX = R.minX;
    currentNode.RmaxX = R.maxX;
    currentNode.RminY = R.minY;
    currentNode.RmaxY = R.maxY;
    currentNode.Lindex = bestPair[0];
    currentNode.Rindex = bestPair[1];
    currentNode.leaf = false;
    nodes[nodeIndex] = currentNode;

    // Update the nodes array
    for (int i = 0; i < numNodes; i++)
    {
        if (i != bestPair[0] && i != bestPair[1])
        {
            nodes[i] = nodes[i + 1];
        }
    }
}

/*==================================================== INSERTION FUNCTIONS ===============================================================*/

// int sortedArray[MAX];

void sortByAreaEnlargement(Node newNode)
{
    int i = 0;
    int area_maxX, area_maxY, area_minX, area_minY;
    int area_enlargement;
    push(0); // Start with the root node index
    while (!isEmpty())
    {
        int nodeIndex = pop();
        Node currentNode = nodes[nodeIndex];

        boundingBox box = calculateBoundingBox(currentNode);
        if (box.maxX >= newNode.maxX && box.minX <= newNode.minX && box.maxY >= newNode.maxY && box.minY <= newNode.minY)
        {
            // new node is within the bounding box
            push(currentNode.Lindex);
            push(currentNode.Rindex);
        }
        else if (currentNode.leaf)
        {
            // new node is leaf
            area_maxX = std::max(currentNode.maxX, newNode.maxX);
            area_maxY = std::max(currentNode.maxY, newNode.maxY);
            area_minX = std::min(currentNode.minX, newNode.minX);
            area_minY = std::min(currentNode.minY, newNode.minY);

            area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - currentNode.area();
            std::cout << "Area Enlargement: " << area_enlargement << " Leaf Node: " << nodeIndex << std::endl;
            sortedArray[i++] = nodeIndex;
        }
        else
        {
            // new node is not within the bounding box
            area_maxX = std::max(box.maxX, newNode.maxX);
            area_maxY = std::max(box.maxY, newNode.maxY);
            area_minX = std::min(box.minX, newNode.minX);
            area_minY = std::min(box.minY, newNode.minY);

            area_enlargement = (area_maxX - area_minX) * (area_maxY - area_minY) - currentNode.area();
            std::cout << "Area Enlargement: " << area_enlargement << " Node: " << nodeIndex << std::endl;
            sortedArray[i++] = nodeIndex;
        }
    }
}

void insert(bool leaf, data_t minX, data_t maxX, data_t minY, data_t maxY)
{
    Node newNode = Node(false, minX, maxX, minY, maxY);
    // for (int i = 0; i < currNumNodes; i++)
    int count = 0;
    push(count); // Start with the root node index

    do
    {
        int nodeIndex = pop();
        Node currentNode = nodes[nodeIndex];
        Node currentNodeParent;

        // if is leaf (Lindex = -1)
        // insert node into Lindex
        // else if Rindex = -1
        // insert node into Rindex
        // else
        // insert into stack (choose subtree)
        // update left index / right index of parent node

        if (currentNode.leaf)
        {
            std::cout << "Adding left leaf" << std::endl;
            // currentNodeParent = Node();
            newNode.leaf = true;

            currentNodeParent.Lindex = currNumNodes;
            nodes[currNumNodes] = newNode; // currNumNodes = array index of newest node, gets updated everytime a node is added
            currNumNodes++;

            currentNodeParent.LminX = newNode.minX;
            currentNodeParent.LmaxX = newNode.maxX;
            currentNodeParent.LminY = newNode.minY;
            currentNodeParent.LmaxY = newNode.maxY;

            nodes[nodeIndex] = currentNodeParent;
        }
        else if (currentNode.Rindex == -1)
        {
            std::cout << "Adding right leaf" << std::endl;
            newNode.leaf = 1;

            currentNode.Rindex = currNumNodes;
            nodes[currNumNodes] = newNode;
            currNumNodes++;

            currentNode.RminX = newNode.minX;
            currentNode.RmaxX = newNode.maxX;
            currentNode.RminY = newNode.minY;
            currentNode.RmaxY = newNode.maxY;

            nodes[nodeIndex] = currentNode;
        }
        else
        {
            push(++count);
            // chooseSubTree();
        }

        // if leaves > max
        // overFlowTreatment();

        // sortByArea();
    } while (!isEmpty() && count < MAX);
}

/*==================================================== DELETION FUNCTIONS ===============================================================*/

// Node deleteNode(Node node)
// {
// }

/*==================================================== KERNEL ===============================================================*/

extern "C" void krnl(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output)
{
#pragma HLS INTERFACE mode = m_axi port = output

    // L:(x1 -> x2) (y1 -> y2), R:(x1 -> x2) (y1 -> y2), Child L, Child R
    nodes[0] = Node(false, 0, 9, 0, 10, 11, 19, 11, 19, 1, 2);
    nodes[1] = Node(false, 0, 4, 0, 4, 5, 9, 5, 9, 3, 4);
    nodes[2] = Node(false, 10, 14, 10, 14, 15, 19, 15, 19, 5, 6);
    // Leaf = true, (x1 -> x2), (y1 -> y2)
    nodes[3] = Node(true, 0, 4, 0, 4);
    nodes[4] = Node(true, 5, 9, 5, 9);
    nodes[5] = Node(true, 10, 14, 10, 14);
    nodes[6] = Node(true, 15, 19, 15, 19);

    // search(minX, maxY, minY, maxY, output);

    // insert(false, 1, 3, 1, 3);
    // insert(false, 3, 4, 3, 4);
    // insert(false, 6, 9, 6, 9);

    // for (int i = 0; i < currNumNodes; i++)
    // {
    //     if (!nodes[i].leaf)
    //     {
    //         std::cout << "Node " << i << ": " << nodes[i].LminX << "->" << nodes[i].LmaxX << " " << nodes[i].LminY << "->" << nodes[i].LmaxY << " " << nodes[i].RminX
    //                   << "->" << nodes[i].RmaxX << " " << nodes[i].RminY << "->" << nodes[i].RmaxY << " L index:" << nodes[i].Lindex << " R index:" << nodes[i].Rindex << std::endl;
    //     }
    //     else
    //     {
    //         std::cout << "Node " << i << ": " << nodes[i].minX << "->" << nodes[i].maxX << " " << nodes[i].minY << "->" << nodes[i].maxY << std::endl;
    //     }
    // }

    nodes[7] = Node(false, 0, 7, 0, 7);
    sortByAreaEnlargement(nodes[7]);
    std::cout << "Sorted Array: ";
    for (int i = 0; i < currNumNodes; i++)
    {
        std::cout << sortedArray[i] << " ";
    }
}