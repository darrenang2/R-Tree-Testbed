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

    Node TREE[MAX_TREE_SIZE];

    int number_of_operations = 50; 
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
    int exe = 100000; 

    int root = 0;
    krnl(
        TREE, 
        operations,
        parameters_for_operations,
        number_of_operations,
        board_num, 
        exe,
        &root
    );


    hls::stream<int> q; 
    hls::stream<int> level;

    int number_of_leaves = 0; 

    q.write(root);
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

                    if (TREE[cur].hasLeaves) {
                        number_of_leaves++; 
                    }

                }
            }
        }
        std::cout << std::endl; 
    }

    std::cout << "TOTAL NUMBER OF LEAVES IN THE TREE: " << number_of_leaves << std::endl; 
    return 0; 
}