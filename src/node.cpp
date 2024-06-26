#include "node.h"

boundingBox setBB(int x1, int x2, int y1, int y2)
{
    boundingBox box;
    box.minX = x1;
    box.maxX = x2;
    box.minY = y1;
    box.maxY = y2;
    return box;
}

int area(boundingBox box)
{
    return (box.maxX - box.minX) * (box.maxY - box.minY);
}

boundingBox intersection(boundingBox box1, boundingBox box2)
{
    boundingBox box;
    box.minX = std::max(box1.minX, box2.minX);
    box.maxX = std::min(box1.maxX, box2.maxX);
    box.minY = std::max(box1.minY, box2.minY);
    box.maxY = std::min(box1.maxY, box2.maxY);
    return box;
}

int edgeDelta(boundingBox box)
{
    int deltaX = box.maxX - box.minX;
    int deltaY = box.maxY - box.minY;
    return deltaX + deltaY;
}

Node createLeaf(bool l, boundingBox box)
{
    Node node;
    node.leaf = &l;
    node.box = box;
    return node;
}

Node createNode()
{
    Node node;
    node.leaf = false;
    node.box = setBB(0, 0, 0, 0);
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        node.child[i] = -1;
    }
    return node;
}

Node createNode(bool l, boundingBox box, int child1, int child2, int child3, int child4, int child5)
{
    Node node;
    node.leaf = l;
    node.box = box;
    node.child[0] = child1;
    node.child[1] = child2;
    node.child[2] = child3;
    node.child[3] = child4;
    node.child[4] = child5;
    node.child[5] = -1;
    return node;
}

Node createNodeFromArray(bool l, boundingBox box, int arr[])
{
    Node node;
    node.leaf = l;
    node.box = box;
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        node.child[i] = arr[i];
    }
    return node;
}

Node getChild(Node parentNode, int index)
{
    return nodes[parentNode.child[index]];
}

int getCenterX(Node node)
{
    return (node.box.minX + node.box.maxX) / 2;
}

int getCenterY(Node node)
{
    return (node.box.minY + node.box.maxY) / 2;
}

// function to compute the distance between the centers of two nodes
int computeDistCenters(Node node1, Node node2)
{
    int x1 = getCenterX(node1);
    int x2 = getCenterX(node2);
    int y1 = getCenterY(node1);
    int y2 = getCenterY(node2);
    return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2);
}

void setBB(Node *node, int x1, int x2, int y1, int y2)
{
    node->box.minX = x1;
    node->box.maxX = x2;
    node->box.minY = y1;
    node->box.maxY = y2;
}

void sortItemsByUpperEdge(int axis, Node node)
{
    // sorting with y-axis
    if (axis == 0)
    {
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            for (int i = 1; i < MAX_CHILDREN; i++)
            {
                if (nodes[node.child[i]].box.maxY < nodes[node.child[i - 1]].box.maxY)
                {
                    int temp = node.child[i];
                    node.child[i] = node.child[i - 1];
                    node.child[i - 1] = temp;
                }
            }
        }
    }
    // sorting with x-axis
    else
    {
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            for (int i = 1; i < MAX_CHILDREN; i++)
            {
                if (nodes[node.child[i]].box.maxX < nodes[node.child[i - 1]].box.maxX)
                {
                    int temp = node.child[i];
                    node.child[i] = node.child[i - 1];
                    node.child[i - 1] = temp;
                }
            }
        }
    }
}

void sortItemsByLowerEdge(int axis, Node node)
{
    // sorting with y-axis
    if (axis == 0)
    {
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            for (int i = 1; i < MAX_CHILDREN; i++)
            {
                if (nodes[node.child[i]].box.minY < nodes[node.child[i - 1]].box.minY)
                {
                    int temp = node.child[i];
                    node.child[i] = node.child[i - 1];
                    node.child[i - 1] = temp;
                }
            }
        }
    }
    // sorting with x-axis
    else
    {
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            for (int i = 1; i < MAX_CHILDREN; i++)
            {
                if (nodes[node.child[i]].box.minX < nodes[node.child[i - 1]].box.minX)
                {
                    int temp = node.child[i];
                    node.child[i] = node.child[i - 1];
                    node.child[i - 1] = temp;
                }
            }
        }
    }
}

void updateBoundingBox(Node *node)
{
    int minX = INT32_MAX;
    int maxX = INT32_MIN;
    int minY = INT32_MAX;
    int maxY = INT32_MIN;
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (node->child[i] != -1)
        {
            minX = std::min(minX, nodes[node->child[i]].box.minX);
            maxX = std::max(maxX, nodes[node->child[i]].box.maxX);
            minY = std::min(minY, nodes[node->child[i]].box.minY);
            maxY = std::max(maxY, nodes[node->child[i]].box.maxY);
        }
    }
    node->box.minX = minX;
    node->box.maxX = maxX;
    node->box.minY = minY;
    node->box.maxY = maxY;
}

bool equals(Node node1, Node node2)
{
    if (node1.leaf != node2.leaf)
    {
        return false;
    }
    if (node1.box.minX != node2.box.minX)
    {
        return false;
    }
    if (node1.box.maxX != node2.box.maxX)
    {
        return false;
    }
    if (node1.box.minY != node2.box.minY)
    {
        return false;
    }
    if (node1.box.maxY != node2.box.maxY)
    {
        return false;
    }
    for (int i = 0; i < MAX_CHILDREN; i++)
    {
        if (node1.child[i] != node2.child[i])
        {
            return false;
        }
    }
    return true;
}
