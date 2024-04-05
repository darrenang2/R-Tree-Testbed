#include "constants.h"
#include <float.h>
#include <iostream>

// Function prototypes for stack functions
bool push(int x);
int pop();
int peek();
bool isEmpty();
void search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t* output);

struct Node {
    bool leaf = 0; 
    //If leaf node
    int minX;
    int maxX;
    int minY;
    int maxY;

    //Intermiate Nodes
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
        :leaf(l), minX(x1), maxX(x2), minY(y1), maxY(y2) {}

    Node(int lx1, int lx2, int ly1, int ly2, int rx1, int rx2, int ry1, int ry2, int li, int ri)
        :LminX(lx1), LmaxX(lx2), LminY(ly1), LmaxY(ly2), RminX(rx1), RmaxX(rx2), RminY(ry1), RmaxY(ry2), Lindex(li), Rindex(ri) {}

    Node()
        :leaf(false){}
};

/***** Initialize Data *****/
Node nodes[7];

extern "C" void krnl(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t* output) {

    #pragma HLS INTERFACE mode=m_axi port=output

    // L:(x1 -> x2) (y1 -> y2), R:(x1 -> x2) (y1 -> y2), Child L, Child R
    nodes[0] = Node(0, 9, 0, 10, 11, 19, 11, 19, 1, 2);
    nodes[1] = Node(0, 4, 0, 4, 5, 9, 5, 9, 3, 4);
    nodes[2] = Node(10, 14, 10, 14, 15, 19, 15, 19, 5, 6);
    // Leaf = true, (x1 -> x2), (y1 -> y2)
    nodes[3] = Node(true, 0, 4, 0, 4);
    nodes[4] = Node(true, 5, 9, 5, 9);
    nodes[5] = Node(true, 10, 14, 10, 14);
    nodes[6] = Node(true, 15, 19, 15, 19);

    search(minX, maxY, minY, maxY, output);

}

void search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t* output) {
    std::cout << "R-Tree Search: (" << minX << "->" << maxX << ")(" << minY << "->" << maxY << ")" << std::endl; 
    //Return counter; 
    int rt = 0;

    push(0);  // Start with the root node index
    
    while (!isEmpty()) {
        int nodeIndex = pop(); // Get the top node from the stack
        Node currentNode = nodes[nodeIndex]; // Get the current node
        
        // Check if current node overlaps with search range
        if (currentNode.leaf) {
            if (currentNode.minX <= maxX && currentNode.maxX >= minX && currentNode.minY <= maxY && currentNode.maxY >= minY) {
                output[rt++] = nodeIndex; // Node index matches search criteria
            }
        } else {
            // If not a leaf node, check if it overlaps with search range
            if (currentNode.LminX <= maxX && currentNode.LmaxX >= minX && currentNode.LminY <= maxY && currentNode.LmaxY >= minY) {
                push(currentNode.Lindex); // Push left child node to stack
            }
            if (currentNode.RminX <= maxX && currentNode.RmaxX >= minX && currentNode.RminY <= maxY && currentNode.RmaxY >= minY) {
                push(currentNode.Rindex); // Push right child node to stack
            }
        }
    }
    std::cout << "Number of nodes with overlap: " << rt << std::endl;

}

/*==================================================== STACK FUNCTIONS ===============================================================*/

#define MAX 1000
int top = -1;
int a[MAX];

bool push(int x) {
    if (top >= (MAX - 1)) { 
        std::cout << "Stack Overflow"; 
        return false; 
    } 
    else { 
        a[++top] = x; 
        std::cout << x << " pushed into stack\n"; 
        return true; 
    } 
} 

int pop() { 
    if (top < 0) { 
        std::cout << "Stack Underflow"; 
        return 0; 
    } 
    else { 
        int x = a[top--]; 
        return x; 
    } 
} 

int peek() { 
    if (top < 0) { 
        std::cout << "Stack is Empty"; 
        return 0; 
    } 
    else { 
        int x = a[top]; 
        return x; 
    } 
} 

bool isEmpty() { 
    return (top < 0); 
} 
