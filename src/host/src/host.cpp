#include "host.h"
#include <stdio.h>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <float.h>
#include <queue>


const int MAX_TREE_SIZE = 5000; 
const int number_of_operations = 1000; 
const int exe = 0; 

#define MAX_CHILDREN 6
#define MIN_CHILDREN 3

struct boundingBox
{
    int minX = 0;
    int maxX = 0;
    int minY = 0;
    int maxY = 0;
};

struct Node
{
    int index; 
    int parent; 
    bool hasLeaves;
    boundingBox box;
    int child[MAX_CHILDREN];
    u_int8_t amount_of_children = 0;

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


int main(int argc, char **argv)
{
    if (argc != 2)
    {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }

    clock_t htod, dtoh, comp;

    /*====================================================CL===============================================================*/
    std::string binaryFile = argv[1];
    cl_int err;
    cl::Context context;
    cl::Kernel krnl1, krnl2, krnl3;
    cl::CommandQueue q;

    auto devices = get_xil_devices();
    auto fileBuf = read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    bool valid_device = false;
    for (unsigned int i = 0; i < devices.size(); i++)
    {
        auto device = devices[i];
        OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
        OCL_CHECK(err, q = cl::CommandQueue(context, device, 0, &err));
        std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS)
        {
            std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
        }
        else
        {
            std::cout << "Device[" << i << "]: program successful!\n";
            std::cout << "Setting CU(s) up..." << std::endl;
            OCL_CHECK(err, krnl1 = cl::Kernel(program, "krnl", &err));
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device)
    {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }

    /*====================================================INIT INPUT/OUTPUT VECTORS===============================================================*/
    
    std::vector<Node, aligned_allocator<Node>> TREE(MAX_TREE_SIZE);
    std::vector<uint32_t, aligned_allocator<uint32_t>> operations(number_of_operations);
    std::vector<uint64_t, aligned_allocator<uint64_t>> parameters_for_operations(number_of_operations);
    int board_num = 0;
    int *root_ptr; 

    std::srand(std::time(0)); 
    int min = 0, max = 100;

    for (int i = 0; i < number_of_operations; i++) {

        operations[i] = 1;

        uint64_t x1 = min + (std::rand() % (max - min + 1));
        uint64_t x2 = min + (std::rand() % (max - min + 1));

        uint64_t y1 = min + (std::rand() % (max - min + 1));
        uint64_t y2 = min + (std::rand() % (max - min + 1));

        if (x1 > x2) {
            uint64_t temp = x1; 
            x1 = x2;
            x2 = temp;
        } else if (x1 == x2) {
            x2 += 1; 
        }

        if (y1 > y2) {
            uint64_t temp = y1;
            y1 = y2;
            y2 = temp;
        } else if (y1 == y2) {
            y2+=1; 
        }

        //std::cout << "(" << x1 << "," << y1 << ")(" << x2 << "," << y2 << ")" << std::endl; 

        y2 = y2 << 48;
        y1 = y1 << 32;
        x2 = x2 << 16;
        parameters_for_operations[i] = y2 + y2 + x2 + x1;

    }

    /*====================================================Setting up kernel I/O===============================================================*/

    /* BUFFERS */
    OCL_CHECK(err, cl::Buffer buffer_tree(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(Node) * MAX_TREE_SIZE, TREE.data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_operations(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(uint32_t) * number_of_operations, operations.data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_parameters(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(uint64_t) * number_of_operations, parameters_for_operations.data(), &err));
    OCL_CHECK(err, cl::Buffer root(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(int), root_ptr, &err));

    /* SETTING INPUT PARAMETERS */
    OCL_CHECK(err, err = krnl1.setArg(0, buffer_tree));
    OCL_CHECK(err, err = krnl1.setArg(1, buffer_operations));
    OCL_CHECK(err, err = krnl1.setArg(2, buffer_parameters));
    OCL_CHECK(err, err = krnl1.setArg(3, number_of_operations));
    OCL_CHECK(err, err = krnl1.setArg(4, board_num));
    OCL_CHECK(err, err = krnl1.setArg(5, 0));
    OCL_CHECK(err, err = krnl1.setArg(6, root));

    /*====================================================KERNEL===============================================================*/
    /* HOST -> DEVICE DATA TRANSFER*/
    std::cout << "HOST -> DEVICE" << std::endl;
    htod = clock();
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_parameters}, 0 /* 0 means from host*/));
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_operations}, 0 /* 0 means from host*/));
    //OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_tree}, 0 /* 0 means from host*/));
    q.finish();
    htod = clock() - htod;

    /*STARTING KERNEL(S)*/
    std::cout << "STARTING KERNEL(S)" << std::endl;
    comp = clock();
    OCL_CHECK(err, err = q.enqueueTask(krnl1));
    q.finish();
    comp = clock() - comp;
    std::cout << "KERNEL(S) FINISHED" << std::endl;

    /*DEVICE -> HOST DATA TRANSFER*/
    std::cout << "HOST <- DEVICE" << std::endl;
    dtoh = clock();
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_tree}, CL_MIGRATE_MEM_OBJECT_HOST));
    q.finish();
    dtoh = clock() - dtoh;

    /*====================================================VERIFICATION & TIMING===============================================================*/

    printf("Host -> Device : %lf ms\n", 1000.0 * htod / CLOCKS_PER_SEC);
    printf("Device -> Host : %lf ms\n", 1000.0 * dtoh / CLOCKS_PER_SEC);
    printf("Computation : %lf ms\n", 1000.0 * comp / CLOCKS_PER_SEC);

    std::queue<int> tq; 
    std::queue<int> level; 
    int number_of_leaves = 0; 

    tq.push(*root_ptr);
    while (!tq.empty()) {

        while (!tq.empty()) {
            level.push(tq.front());
            tq.pop();
        }

        while (!level.empty()) {

            int cur = level.front();
            level.pop(); 

            if (TREE[cur].index != -1) {

                std::cout << cur << ": ("<<TREE[cur].box.minX<<","<<TREE[cur].box.minY<<")("<<TREE[cur].box.maxX<<","<<TREE[cur].box.maxY<<") ";
            } 

            for (int i = 0; i < MAX_CHILDREN; i++) {
                if (TREE[cur].child[i] != -1) {
                    tq.push(TREE[cur].child[i]);

                    if (TREE[cur].hasLeaves) {
                        number_of_leaves++; 
                    }

                }
            }
        }
        std::cout << std::endl; 
    }




    std::cout << std::endl
              << "FIN" << std::endl;
    return 0;
}
