#include "constants.h"
#include "krnlSearch.h"
#include "krnlInsert.h"
#include "constants.h"
#include "stack.h"
#include "node.h"
#include "overlapEnlargementPair.h"
#include "areaEnlargementPair.h"
#include "nodeArray.h"
#include "climits"

int main()
{
    static hls::stream<boundingBox> searchInput;
    static hls::stream<data_t> searchOutput;
    static hls::stream<int> search2mem;
    static hls::stream<Node> mem2search;

    static hls::stream<Node> cst2mem;
    static hls::stream<int> mem2cst;
    static hls::stream<Node> cstInput;
    static hls::stream<int> cstOutput;

    static hls::stream<Node> insert2mem;
    static hls::stream<int> mem2insert;
    static hls::stream<int> index2mem;
    static hls::stream<Node> insertInput;
    static hls::stream<int> insertOutput;

    static hls::stream<Node> overflow2mem;
    static hls::stream<Node> mem2overflow;
    static hls::stream<Node> overflowInput;
    static hls::stream<Node> overflowOutput;

    static hls::stream<Node> split2mem;
    static hls::stream<Node> mem2split;
    static hls::stream<Node> splitInput;
    static hls::stream<Node> splitOutput;

    static hls::stream<Node> reinsert2mem;
    static hls::stream<int> mem2reinsert;
    static hls::stream<Node> reinsertInput;
    static hls::stream<int> reinsertOutput;

    static hls::stream<Node> overflow2reinsert;
    static hls::stream<Node> overflow2split;
    static hls::stream<Node> split2overflow;

    Node HBM_PTR[2000];

    data_t searchResult;
    static int insertResult;
    static int cnt = 0;

    HBM_PTR[200] = createNode(false, setBB(0, 20, 0, 20), 100, 101, 102, -1, -1);
    HBM_PTR[100] = createNode(false, setBB(0, 9, 0, 9), 0, 1, 2, 3, 4);
    HBM_PTR[101] = createNode(false, setBB(10, 20, 10, 20), 5, 6, -1, -1, -1);
    HBM_PTR[102] = createNode(false, setBB(0, 16, 0, 16), -1, -1, -1, -1, -1);
    HBM_PTR[0] = createLeaf(true, setBB(0, 4, 0, 4));
    HBM_PTR[1] = createLeaf(true, setBB(5, 9, 5, 9));
    HBM_PTR[2] = createLeaf(true, setBB(10, 14, 10, 14));
    HBM_PTR[3] = createLeaf(true, setBB(15, 19, 15, 19));
    HBM_PTR[4] = createLeaf(true, setBB(0, 7, 0, 7));
    HBM_PTR[5] = createLeaf(true, setBB(10, 14, 10, 14));
    HBM_PTR[6] = createLeaf(true, setBB(17, 19, 17, 19));

    searchInput.write(setBB(0, 10, 0, 10));

    Node newNode = createNode(false, setBB(12, 13, 12, 13), -1, -1, -1, -1, -1);
    cstInput.write(newNode);
    insertInput.write(newNode);

    while (cnt < 20)
    {
        cnt++;

        chooseSubTree(
            cst2mem,
            mem2cst,
            cstInput,
            cstOutput);

        // if (!cstOutput.empty())
            insert(
                insert2mem,
                mem2insert,
                index2mem,
                cstOutput,
                insertInput,
                insertOutput);

        if (!insertOutput.empty())
        {
            insertOutput.read(insertResult);
            std::cout << "Insert: " << insertResult << std::endl;
            // 1 = no overflow, 2 = overflow
        }

        if (!overflow2mem.empty())
        {
            std::cout << "Overflow" << std::endl;
        }

        memory_manager(
            search2mem,
            mem2search,
            cst2mem,
            mem2cst,
            insert2mem,
            mem2insert,
            index2mem,
            overflow2mem,
            mem2overflow,
            overflow2reinsert,
            overflow2split,
            split2overflow,
            HBM_PTR);
    }
}