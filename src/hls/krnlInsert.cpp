#include "krnlInsert.h"

#define INSERT_DEBUG 1

// void chooseSubTree(hls::stream<Node> &cst2mem,
//                    hls::stream<int> &mem2cst,
//                    hls::stream<Node> &cstInput,
//                    hls::stream<int> &cstOutput)
// {
//     static Node newNode;
//     static int result = -1;

//     enum cstStates
//     {
//         INIT,
//         WRITE,
//         RECEIVE,
//         FOUND
//     };
//     static cstStates state = INIT;

//     switch (state)
//     {
//     case INIT:
//         if (!cstInput.empty())
//         {
//             std::cout << "Choose Subtree: INIT" << std::endl;
//             cstInput.read(newNode);
//             state = WRITE;
//         }
//         break;
//     case WRITE:
//         if (!cst2mem.full())
//         {
//             std::cout << "Choose Subtree: WRITE" << std::endl;
//             cst2mem.write(newNode);
//             state = RECEIVE;
//         }
//         break;
//     case RECEIVE:
//         if (!mem2cst.empty())
//         {
//             std::cout << "Choose Subtree: RECEIVE" << std::endl;
//             mem2cst.read(result);
//             // std::cout << "Choose Subtree result: " << result << std::endl;
//             state = FOUND;
//         }
//         break;
//     case FOUND:
//         std::cout << "Choose Subtree: FOUND" << std::endl;
//         std::cout << "result: " << result << std::endl;
//         cstOutput.write(result);
//         state = INIT;
//         break;
//     }
// }

// void insert(
//             hls::stream<Node> &insert2mem,
//             hls::stream<int> &mem2insert,
//             hls::stream<int> &index2mem,
//             hls::stream<int> &cstOutput,
//             hls::stream<Node> &insertInput,
//             hls::stream<int> &insertOutput)
// {
//     static int index = -1;
//     static int result = -1;
//     Node newNode;

//     enum InsertStates
//     {
//         READ_NODE,
//         READ_INDEX,
//         WRITE_INDEX,
//         INSERT,
//         OVERFLOWTREATMENT,
//         OUTPUT
//     };
//     static InsertStates state = READ_NODE;

//     switch (state)
//     {
//     case READ_NODE:
//         if (!insertInput.empty())
//         {
//             std::cout << "Insert: READ_NODE" << std::endl;
//             insertInput.read(newNode);
//             state = READ_INDEX;
//         }
//         break;
//     case READ_INDEX:
//         if (!cstOutput.empty())
//         {
//             std::cout << "Insert: READ_INDEX" << std::endl;
//             cstOutput.read(index);
//             state = WRITE_INDEX;
//         }
//         break;
//     case WRITE_INDEX:
//         // std::cout << "Insert: WRITE_INDEX" << std::endl;
//         if (!index2mem.full())
//         {
//             std::cout << "Insert: WRITE_INDEX" << std::endl;
//             index2mem.write(index);
//             state = INSERT;
//         }
//         break;
//     case INSERT:
//         if (!insert2mem.full())
//         {
//             std::cout << "Insert: INSERT" << std::endl;
//             insert2mem.write(newNode);
//             state = OVERFLOWTREATMENT;
//         }
//         break;
//     case OVERFLOWTREATMENT:
//         if (!mem2insert.empty())
//         {
//             std::cout << "Insert: OVERFLOWTREATMENT" << std::endl;
//             mem2insert.read(result);
//         }
//         state = OUTPUT;
//         break;
//     case OUTPUT:
//         if (!insertOutput.full())
//         {
//             std::cout << "Insert: OUTPUT" << std::endl;
//             // OUTPUT = 1 if insertion is successful, 2 if overflow treatment is required
//             insertOutput.write(result);
//             state = READ_NODE;
//         }
//         break;
//     }
// }

// void overflowTreatment(hls::stream<Node> &overflow2mem,
//                        hls::stream<Node> &mem2overflow,
//                        hls::stream<Node> &overflowInput,
//                        hls::stream<Node> &overflowOutput)
// {
//     Node newNode;
//     Node result;

//     enum overflowStates
//     {
//         INIT,
//         WRITE,
//         RECEIVE,
//         FOUND
//     };
//     static overflowStates state = INIT;

//     switch (state)
//     {
//     case INIT:
//         if (!overflowInput.empty())
//         {
//             std::cout << "Overflow Treatment: INIT" << std::endl;
//             overflowInput.read(newNode);
//             state = WRITE;
//         }
//         break;
//     case WRITE:
//         if (!overflow2mem.full())
//         {
//             std::cout << "Overflow Treatment: WRITE" << std::endl;
//             overflow2mem.write(newNode);
//             state = RECEIVE;
//         }
//         break;
//     case RECEIVE:
//         if (!mem2overflow.empty())
//         {
//             std::cout << "Overflow Treatment: RECEIVE" << std::endl;
//             mem2overflow.read(result);
//             state = FOUND;
//         }
//         break;
//     case FOUND:
//         std::cout << "Overflow Treatment: FOUND" << std::endl;
//         overflowOutput.write(result);
//         state = INIT;
//         break;
//     }
// }


void insert(
    hls::stream<Node> &newLeaf2insert,
    hls::stream<Node> &insertNode4insert,
    hls::stream<int> &getNode4insert,
    hls::stream<Node> &receiveNode4insert,
    hls::stream<Node> &writeChanges4insert,
    hls::stream<Node> &overflow2split,
    hls::stream<Node> &cst_req,
    hls::stream<Node> &split2overflow,
    hls::stream<bool> &insertFinished
) {

    enum InsertStates
    {
        INIT,
        NEWLEAF,
        GET_NODE,
        INSERT_INTERVAL,
        OVF,
        WAIT,
        FIN
    };

    static InsertStates state = INIT;
    static Node newLeaf; 
    static Node cur; 
    static bool addLeaf = false; 
    static bool root_exists = false; 
    static bool received = false; 
    static bool wait = false; 

    //Transitions
    switch (state)
    {
    case INIT:
        #if INSERT_DEBUG
            std::cout << "STATE = INIT" << std::endl;
        #endif
        state = NEWLEAF;
        break;
    
    case NEWLEAF:
        #if INSERT_DEBUG
            std::cout << "STATE = NEWLEAF" << std::endl;
        #endif
        if (addLeaf) {
            addLeaf = false; 
            state = GET_NODE;
        } else {
            state = NEWLEAF; 
        }
        break;
    
    case GET_NODE:
        #if INSERT_DEBUG
            std::cout << "STATE = GET_NODE" << std::endl;
        #endif
        if (received) {
            received = false;
            state = INSERT_INTERVAL;
        } else {
            state = GET_NODE;
        }
        break;
    
    case INSERT_INTERVAL:
        #if INSERT_DEBUG
            std::cout << "STATE = INSERT_INTERVAL" << std::endl;
        #endif
        if (!cur.hasLeaves) {
            state = GET_NODE;
        } else if (cur.child[MAX_CHILDREN-1] != -1) {
            state = OVF; 
        } else  {
            state = FIN; 
        }
        break; 

    case OVF:
        #if INSERT_DEBUG
            std::cout << "STATE = OVF" << std::endl;
        #endif
        state = WAIT; 
        break; 

    case WAIT:
        #if INSERT_DEBUG
            std::cout << "STATE = WAIT" << std::endl;
        #endif
        if (wait && cur.amount_of_children == MAX_CHILDREN) {
            wait = false; 
            state = OVF; 
        } else if (wait) {
            wait = false; 
            state = FIN;
        } else {
            state = WAIT; 
        }
        break;

    case FIN:
        #if INSERT_DEBUG
            std::cout << "STATE = FIN" << std::endl;
        #endif
        state = NEWLEAF; 
        break; 

    default:
        break;
    }

    switch (state)
    {
    case NEWLEAF:
        if (!newLeaf2insert.empty()) {
            
            addLeaf = true; 
            newLeaf = newLeaf2insert.read();

            // If root doesn't exit, create a root and push it for insertion. 
            if (root_index == -1) {
                #if INSERT_DEBUG
                    std::cout << "no leader creating leader!" << std::endl;
                #endif
                Node root;
                root.index = node_numbers;
                root.box = newLeaf.box;
                root.hasLeaves = true;
                insertNode4insert.write(root);
                cur = root; 
                root_index = node_numbers;
                node_numbers++;  
                std::cout << "ROOT: " << root_index << std::endl; 
            }
            getNode4insert.write(root_index);

        }
        break;

    case GET_NODE:
        if (!receiveNode4insert.empty()) {
            cur = receiveNode4insert.read();
            #if INSERT_DEBUG
                std::cout << "Node " << cur.index << " has " << cur.amount_of_children << " leaves" << std::endl;
            #endif
            received = true; 
        }
        break; 

    case INSERT_INTERVAL:
        cur.box = strech(cur.box, newLeaf.box);
        if (cur.hasLeaves) {
            // for (int i = 0; i < MAX_CHILDREN; i++) {
            //     if (cur.child[i] == -1){
            //         newLeaf.index = node_numbers; 
            //         newLeaf.parent = cur.index; 
            //         cur.child[i] = node_numbers;
            //         node_numbers++; 
            //         cur.amount_of_children++; 
            //         break; 
            //     }
            // }
            #if INSERT_DEBUG
                std::cout << "Adding new node to " << cur.index << " as leaf" << std::endl;
                std::cout << "Node " << cur.index << " has " << cur.amount_of_children << " leaves" << std::endl;
            #endif
            newLeaf.index = node_numbers; 
            newLeaf.parent = cur.index; 
            cur.child[cur.amount_of_children] = node_numbers;
            #if INSERT_DEBUG
                std::cout << "Node " << cur.index << " has " << cur.amount_of_children << "leaves" << std::endl;
            #endif
            node_numbers++; 
            cur.amount_of_children++; 
            insertNode4insert.write(newLeaf);
        } else {
            //Pass the new leaf and the current node to choose sub tree
            cst_req.write(cur);
            cst_req.write(newLeaf);
        }
        writeChanges4insert.write(cur);
        break; 

    case OVF:
        overflow2split.write(cur);
        break; 

    case WAIT:
        if (!split2overflow.empty()) {
            wait = true; 
            cur = split2overflow.read();
        }
        break; 

    case FIN:
        insertFinished.write(true);
        break; 
    
    default:
        break;
    }


}



