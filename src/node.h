#ifndef NODE_H
#define NODE_H

#define MAX_CHILDREN 6

#include <float.h>
#include <iostream>
#include <algorithm>

typedef struct
{
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;
} boundingBox;

typedef struct
{
    bool leaf;
    boundingBox box;
    int child[MAX_CHILDREN];
} Node;

boundingBox setBB(int x1, int x2, int y1, int y2);
int area(boundingBox box);
boundingBox intersection(boundingBox box1, boundingBox box2);
int edgeDelta(boundingBox box);

Node createLeaf(bool l, boundingBox box);
Node *createNode();
Node createNode(bool l, boundingBox box, int child1, int child2, int child3, int child4, int child5);
Node createNodeFromArray(bool l, boundingBox box, int children[MAX_CHILDREN]);
Node *getChild(Node *node, int index);
int getCenterX(Node *node);
int getCenterY(Node *node);
int computeDistCenters(Node *node1, Node *node2);
void setBB(Node *node, int x1, int x2, int y1, int y2);
void sortItemsByUpperEdge(int axis, Node *node);
void sortItemsByLowerEdge(int axis, Node *node);
void updateBoundingBox(Node *node);
bool equals(Node *node1, Node *node2);
void printNode(Node *node);

#endif // NODE_H
