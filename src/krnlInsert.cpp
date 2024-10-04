#include "krnlInsert.h"

void chooseSubTree(hls::stream<Node> &cst2mem,
                   hls::stream<int> &mem2cst,
                   hls::stream<Node> &cstInput,
                   hls::stream<int> &cstOutput)
{
    Node newNode;
    int result;

    enum cstStates
    {
        INIT,
        WRITE,
        RECEIVE,
        FOUND
    };
    static cstStates state = INIT;

    switch (state)
    {
    case INIT:
        if (!cstInput.empty())
        {
            std::cout << "Choose Subtree: INIT" << std::endl;
            cstInput.read(newNode);
            state = WRITE;
        }
        break;
    case WRITE:
        if (!cst2mem.full())
        {
            std::cout << "Choose Subtree: WRITE" << std::endl;
            cst2mem.write(newNode);
            state = RECEIVE;
        }
        break;
    case RECEIVE:
        if (!mem2cst.empty())
        {
            std::cout << "Choose Subtree: RECEIVE" << std::endl;
            mem2cst.read(result);
            state = FOUND;
        }
        break;
    case FOUND:
        std::cout << "Choose Subtree: FOUND" << std::endl;
        cstOutput.write(result);
        state = INIT;
        break;
    }
}

void insert(hls::stream<Node> &insert2mem,
            hls::stream<int> &mem2insert,
            hls::stream<int> &index2mem,
            hls::stream<int> &cstOutput,
            hls::stream<Node> &insertInput,
            hls::stream<int> &insertOutput)
{
    static int index = -1;
    static int result = -1;
    Node newNode;

    enum InsertStates
    {
        READ_NODE,
        READ_INDEX,
        WRITE_INDEX,
        INSERT,
        OVERFLOWTREATMENT,
        OUTPUT
    };
    static InsertStates state = READ_NODE;

    switch (state)
    {
    case READ_NODE:
        if (!insertInput.empty())
        {
            std::cout << "Insert: READ_NODE" << std::endl;
            insertInput.read(newNode);
            state = READ_INDEX;
        }
        break;
    case READ_INDEX:
        if (!cstOutput.empty())
        {
            std::cout << "Insert: READ_INDEX" << std::endl;
            cstOutput.read(index);
            state = WRITE_INDEX;
        }
        break;
    case WRITE_INDEX:
        if (!index2mem.full())
        {
            std::cout << "Insert: WRITE_INDEX" << std::endl;
            index2mem.write(index);
            state = INSERT;
        }
        break;
    case INSERT:
        if (!insert2mem.full())
        {
            std::cout << "Insert: INSERT" << std::endl;
            insert2mem.write(newNode);
            state = OVERFLOWTREATMENT;
        }
        break;
    case OVERFLOWTREATMENT:
        if (!mem2insert.empty())
        {
            std::cout << "Insert: OVERFLOWTREATMENT" << std::endl;
            mem2insert.read(result);
            state = OUTPUT;
        }
        break;
    case OUTPUT:
        if (!insertOutput.full())
        {
            std::cout << "Insert: OUTPUT" << std::endl;
            // OUTPUT = 1 if insertion is successful, 2 if overflow treatment is required
            insertOutput.write(result);
        }
        break;
    }
}
