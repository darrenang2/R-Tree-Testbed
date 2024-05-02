#include "constants.h"
#include <float.h>
#include <iostream>
#include <algorithm>

/*==================================================== NODE STRUCTURE ===============================================================*/

struct Node
{
    bool leaf = 0;
    // If leaf node
    int minX;
    int maxX;
    int minY;
    int maxY;

    // Intermiate Nodes
    int LminX;
    int LmaxX;
    int LminY;
    int LmaxY;

    int RminX;
    int RmaxX;
    int RminY;
    int RmaxY;

    int Lindex;
    int Rindex;

    Node(bool l, int x1, int x2, int y1, int y2)
        : leaf(l), minX(x1), maxX(x2), minY(y1), maxY(y2) {}

    Node(int lx1, int lx2, int ly1, int ly2, int rx1, int rx2, int ry1, int ry2, int li, int ri)
        : LminX(lx1), LmaxX(lx2), LminY(ly1), LmaxY(ly2), RminX(rx1), RmaxX(rx2), RminY(ry1), RmaxY(ry2), Lindex(li), Rindex(ri) {}

    Node()
        : leaf(false) {}

    int area()
    {
        return (maxX - minX) * (maxY - minY);
    }

    bool overlap(Node node1, Node node2)
    {
        return (node1.minX <= node2.maxX && node1.maxX >= node2.minX && node1.minY <= node2.maxY && node1.maxY >= node2.minY);
    }
};

/*==================================================== INITIALIZE DATA ===============================================================*/

#define MAX 100             // Max number of nodes
#define INT_MAX 2147483647; // Max integer value

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
    for (int i = 0; i < numNodes; i++)
    {
        for (int j = i + 1; j < numNodes; j++)
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

void insertLeaf(Node node, int nodeIndex)
{
    nodes[nodeIndex + 1] = node;
    // update previous nodes to have the new node as a child
    Node currentNode = nodes[nodeIndex];

    currentNode.leaf = false;
    currentNode.Lindex = nodeIndex;
    currentNode.Rindex = nodeIndex + 1;
    nodes[nodeIndex] = currentNode;

}

void insert(data_t minX, data_t maxX, data_t minY, data_t maxY)
{
    Node node = Node(false, minX, maxX, minY, maxY);
    sortByArea();
    push(0); // Start with the root node index
    int nodeIndex = pop();
    Node currentNode = nodes[nodeIndex];

    while (!isEmpty)
    {
        if (currentNode.area() < node.area())
        {
            split(nodeIndex, currentNode, node);
        }
        else
        {
            insertLeaf(node, nodeIndex);
        }
    }
}

/*==================================================== DELETION FUNCTIONS ===============================================================*/

// Node deleteNode(Node node)
// {
// }


/*==================================================== KERNEL ===============================================================*/

extern "C" void krnl(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output, data_t newNode)
{
#pragma HLS INTERFACE mode = m_axi port = output

    // L:(x1 -> x2) (y1 -> y2), R:(x1 -> x2) (y1 -> y2), Child L, Child R
    nodes[0] = Node(0, 9, 0, 10, 11, 19, 11, 19, 1, 2);
    nodes[1] = Node(0, 4, 0, 4, 5, 9, 5, 9, 3, 4);
    nodes[2] = Node(10, 14, 10, 14, 15, 19, 15, 19, 5, 6);
    // Leaf = true, (x1 -> x2), (y1 -> y2)
    nodes[3] = Node(true, 0, 4, 0, 4);
    nodes[4] = Node(true, 5, 9, 5, 9);
    nodes[5] = Node(true, 10, 14, 10, 14);
    nodes[6] = Node(true, 15, 19, 15, 19);

    // search(minX, maxY, minY, maxY, output);
    
    insert(1, 3, 1, 3);
    for (int i = 0; i < numNodes; i++)
    {
        std::cout << "Node " << i << ": " << nodes[i].minX << "->" << nodes[i].maxX << " " << nodes[i].minY << "->" << nodes[i].maxY << std::endl;
    }
}

