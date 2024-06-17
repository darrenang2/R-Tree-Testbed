#ifndef NODE_H
#define NODE_H

#define MAX_CHILDREN 5
#define MAX_NODES 100

typedef struct {
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;
} boundingBox;

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

typedef struct {
    bool leaf;
    boundingBox box;
    int child[MAX_CHILDREN];
} Node;

Node nodes[MAX_NODES];

static Node createLeaf(bool l, boundingBox box) {
    Node node;
    node.leaf = l;
    node.box = box;
    return node;
}

static Node createNode(bool l, boundingBox box, int child1, int child2, int child3, int child4, int child5) {
    Node node;
    node.leaf = l;
    node.box = box;
    node.child[0] = child1;
    node.child[1] = child2;
    node.child[2] = child3;
    node.child[3] = child4;
    node.child[4] = child5;
    return node;
}

static Node createNodeFromArray(bool l, boundingBox box, int arr[]) {
    Node node;
    node.leaf = l;
    node.box = box;
    for (int i = 0; i < MAX_CHILDREN; i++) {
        node.child[i] = arr[i];
    }
    return node;
}

static Node getChild(Node parentNode, int index) {
    return nodes[parentNode.child[index]];
}

#endif // NODE_H
