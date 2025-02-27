#include "krnl.h"

extern "C" void krnl(
    Node *HBM_PTR,
    ap_uint<32> *operations,
    ap_uint<64> *parameters_for_operations,
    int number_of_operations,
    int board_num,
    int exe,
    int *root
) {

    #pragma HLS INTERFACE m_axi port=HBM_PTR depth=MAX_TREE_SIZE bundle=TREE_BUS

    #pragma HLS INTERFACE m_axi port=operations depth=1000 bundle=OP_BUS
    #pragma HLS INTERFACE m_axi port=parameters_for_operations depth=1000 bundle=OP_BUS

    #pragma HLS INTERFACE s_axilite port=number_of_operations
    #pragma HLS INTERFACE s_axilite port=board_num
    #pragma HLS INTERFACE s_axilite port=exe
    #pragma HLS INTERFACE s_axilite port=root

    int operation = 0;
    int debugCounter = 0;
    ap_uint<32> curr;
    ap_uint<64> param;
    data_t searchResult;
    data_t insertResult;
    static bool startChooseSubtree = true;

    bool searchFin = true; 
    bool insertFin = true; 
    bool removeFin = true; 


    // INSERT -> MEM MANAGER 
    hls::stream<Node> newLeaf2insert;
    hls::stream<Node> insertNode4insert;
    hls::stream<int> getNode4insert;
    hls::stream<Node> receiveNode4insert;
    hls::stream<Node> writeChanges4insert;
    hls::stream<Node> overflow2split;
    hls::stream<Node> cst_req;
    hls::stream<Node> split2overflow;
    hls::stream<bool> insertFinished;

    while (operation < number_of_operations && debugCounter < exe) {
        debugCounter++;
        curr = operations[operation];
        param = parameters_for_operations[operation];

        switch (curr)
        {
        //SEARCH
        // case 0:
        //     if (searchFin) {
        //         std::cout << "Starting search"<< std::endl;
        //         searchFin = false; 
        //         boundingBox searchTerm = setBB(param.range(15, 0), param.range(31, 16), param.range(47, 32), param.range(63, 48));
        //         searchInput.write(searchTerm);
        //     }
        //     break;

        case 1:
            if (insertFin) {
                Node newNode = createNode(true, setBB(param.range(15, 0), param.range(31, 16), param.range(47, 32), param.range(63, 48)), -1, -1, -1, -1, -1);
                std::cout << "New Node: (" << newNode.box.minX << "," << newNode.box.minY << ")-(" << newNode.box.maxX << "," << newNode.box.maxY << ")" << std::endl; 
                insertFin = false;
                newLeaf2insert.write(newNode);
            }
            break; 

        // case 2:
        //     if (removeFin) {
        //         std::cout << "Starting remove"<< std::endl;
        //         removeFin = false; 
        //         removeIndex.write(param.range(63, 0));
        //     }
        //     break; 

        default:
            break;
        }

        // search(
        //     searchInput,
        //     searchOutput,
        //     search2mem,
        //     mem2search
        // );

        // chooseSubTree(
        //     cst2mem,
        //     mem2cst,
        //     cstInput,
        //     cstOutput
        // );

        insert(
            newLeaf2insert,
            insertNode4insert,
            getNode4insert,
            receiveNode4insert,
            writeChanges4insert,
            overflow2split,
            cst_req,
            split2overflow,
            insertFinished
        );

        // remove(
        //     removeIndex,
        //     removeIndex2mem,
        //     mem2removeLevel,
        //     mem2removeIndex,
        //     mem2removeNode,
        //     removeOuput
        // );

        memory_manager(
            insertNode4insert,
            getNode4insert,
            receiveNode4insert,
            writeChanges4insert,
            overflow2split,
            cst_req,
            split2overflow,
            HBM_PTR
        );
    
        // while (!searchOutput.empty())
        // {
        //     operation++;
        //     searchFin = true; 
        //     searchOutput.read(searchResult);
        //     std::cout << "Found: " << searchResult << std::endl;
        // }
    
        if (!insertFinished.empty())
        {   
            std::cout << "Insert finished..." << std::endl; 

            operation++;
            insertFin = insertFinished.read();
            // 1 = no overflow, 2 = overflow
        }
    
        // if (!removeOuput.empty()) {
        //     bool rFin; 
        //     removeOuput.read(rFin);
        //     operation++; 
        // }

        //std::cout << "Setting output root to " << root_index << std::endl; 
        *root = root_index; 
        
    }
    
}