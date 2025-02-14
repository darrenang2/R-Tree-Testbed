#include "constants.h"
#include "krnlSearch.h"
#include "krnlInsert.h"
#include "krnlRemove.h"
#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include "climits"
#include "krnl.h"
#include <ctime>

int main()
{

    Node TREE[2000];
    //TREE[0] = createNode(false, setBB(0, 0, 0, 0), -1, -1, -1, -1, -1);
    // TREE[100] = createNode(false, setBB(0, 9, 0, 9), 0, 1, 2, 3, 4);
    // TREE[101] = createNode(false, setBB(10, 20, 10, 20), 5, 6, -1, -1, -1);
    // TREE[102] = createNode(false, setBB(0, 16, 0, 16), -1, -1, -1, -1, -1);
    // TREE[0] = createLeaf(true, setBB(0, 4, 0, 4));
    // TREE[1] = createLeaf(true, setBB(5, 9, 5, 9));
    // TREE[2] = createLeaf(true, setBB(1, 3, 1, 3));
    // TREE[3] = createLeaf(true, setBB(5, 8, 5, 8));
    // TREE[4] = createLeaf(true, setBB(0, 7, 0, 7));
    // TREE[5] = createLeaf(true, setBB(10, 14, 10, 14));
    // TREE[6] = createLeaf(true, setBB(17, 19, 17, 19));


    int number_of_operations = 12; 
    ap_uint<64> x;

    //Insert
    x.range(15, 0) = 0;
    x.range(31, 16) = 10;
    x.range(47, 32) = 0;
    x.range(63, 48) = 10; 

    ap_uint<64> parameters_for_operations[number_of_operations];
    ap_uint<32> operations[number_of_operations];
    std::srand(std::time(0)); 
    int min = 0, max = 100;

    for (int i = 0; i < number_of_operations; i++) {

        operations[i] = 1;


        int x1 = min + (std::rand() % (max - min + 1));
        int x2 = min + (std::rand() % (max - min + 1));

        int y1 = min + (std::rand() % (max - min + 1));
        int y2 = min + (std::rand() % (max - min + 1));

        if (x1 > x2) {
            int temp = x1; 
            x1 = x2;
            x2 = temp;
        } else if (x1 == x2) {
            x2 += 1; 
        }

        if (y1 > y2) {
            int temp = y1;
            y1 = y2;
            y2 = temp;
        } else if (y1 == y2) {
            y2+=1; 
        }

        std::cout << "(" << x1 << "," << y1 << ")(" << x2 << "," << y2 << ")" << std::endl; 

        parameters_for_operations[i].range(15, 0) = x1;
        parameters_for_operations[i].range(31, 16) = x2;
        parameters_for_operations[i].range(47, 32) = y1;
        parameters_for_operations[i].range(63, 48) = y2;

    }
    int board_num = 0; 
    int exe = 50; 


    krnl(
        TREE, 
        operations,
        parameters_for_operations,
        number_of_operations,
        board_num, 
        exe
    );


    hls::stream<int> q; 
    hls::stream<int> level;

    q.write(0);
    while (!q.empty()) {

        while (!q.empty())
            level.write(q.read());

        while (!level.empty()) {

            int cur = level.read();

            if (TREE[cur].index != -1) {
                std::cout << cur << ": ("<<TREE[cur].box.minX<<","<<TREE[cur].box.minY<<")("<<TREE[cur].box.maxX<<","<<TREE[cur].box.maxY<<") ";
            }

            for (int i = 0; i < MAX_CHILDREN; i++) {
                if (TREE[cur].child[i] != -1) {
                    q.write(TREE[cur].child[i]);
                }
            }
        }
        std::cout << std::endl; 
    }
}