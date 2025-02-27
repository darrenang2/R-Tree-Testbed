#ifndef NODE_H
#define NODE_H

#define MAX_CHILDREN 6
#define MIN_CHILDREN 3

#include <float.h>
#include <iostream>
#include <algorithm>
#include "ap_int.h"

struct __attribute__((packed)) boundingBox
{
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;
};

struct __attribute__((packed)) Node
{
    int index; 
    int parent; 
    bool hasLeaves;
    boundingBox box;
    int child[MAX_CHILDREN];
    ap_uint<4> amount_of_children = 0;

    Node()
    {
        index = -1;
        parent = -1; 
        hasLeaves = false;
        box = boundingBox();
        for (int i = 0; i < MAX_CHILDREN; i++)
        {
            child[i] = -1;
        }
    }
};

boundingBox setBB(int x1, int x2, int y1, int y2);
boundingBox strech(boundingBox base, boundingBox st);
int getArea(boundingBox box);
boundingBox intersection(boundingBox box1, boundingBox box2);
int edgeDelta(boundingBox box);
int getminX(boundingBox box);
int getmaxX(boundingBox box);
int getminY(boundingBox box);
int getmaxY(boundingBox box);

Node createLeaf(bool l, boundingBox box);
Node *createNode();
Node createNode(bool l, boundingBox box, int child1, int child2, int child3, int child4, int child5);
Node createNodeFromArray(bool l, boundingBox box, int children[MAX_CHILDREN]);
Node getChild(Node node, int index);
int getCenterX(Node node);
int getCenterY(Node node);
int computeDistCenters(Node node1, Node node2);
void setBB(Node node, int x1, int x2, int y1, int y2);
void sortItemsByUpperEdge(int axis, Node node);
void sortItemsByLowerEdge(int axis, Node node);
void updateBoundingBox(Node node);
bool equals(Node node1, Node node2);
void printNode(Node *node);

#endif // NODE_H
