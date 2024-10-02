#include "host.h"
#include <stdio.h>
#include "constants.h"
#include "node.h"
#include <vector>
#include <cmath>
#include <cstdlib>
#include <float.h>

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
    std::vector<Node, aligned_allocator<Node>> HBM_PTR(10000);
    std::vector<uint32_t, aligned_allocator<uint32_t>> operations(1);
    std::vector<uint64_t, aligned_allocator<uint64_t>> parameters_for_operations(4);
    int number_of_operations = 1;
    int board_num = 0;

    // SEARCH AREA
    // int x1 = 1;
    // int x2 = 6;
    // int y1 = 1;
    // int y2 = 6;

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

    operations[0] = 1;
    parameters_for_operations[0] = 0x0006000100060001;
    parameters_for_operations[1] = 0xFFFFFFFFFFFFFFFF;
    parameters_for_operations[2] = 0xFFFFFFFFFFFFFFFF;
    parameters_for_operations[3] = 0xFFFFFFFF00000000;

    /*====================================================Setting up kernel I/O===============================================================*/

    /* OUTPUT BUFFERS */
    OCL_CHECK(err, cl::Buffer buffer_hbm(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(Node) * 10000, HBM_PTR.data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_operations(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(uint32_t) * number_of_operations, operations.data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_parameters(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, sizeof(uint64_t) * number_of_operations * 4, parameters_for_operations.data(), &err));

    /* SETTING INPUT PARAMETERS */
    // Node *HBM_PTR,
    // ap_uint<32> *operations,
    // int number_of_operations,
    // ap_uint<64> *parameters_for_operations,
    // // RDMA
    // int board_num)

    OCL_CHECK(err, err = krnl1.setArg(0, buffer_hbm));
    OCL_CHECK(err, err = krnl1.setArg(1, buffer_operations));
    OCL_CHECK(err, err = krnl1.setArg(2, number_of_operations));
    OCL_CHECK(err, err = krnl1.setArg(3, buffer_parameters));
    OCL_CHECK(err, err = krnl1.setArg(4, board_num));
    OCL_CHECK(err, err = krnl1.setArg(5, 30));

    /*====================================================KERNEL===============================================================*/
    /* HOST -> DEVICE DATA TRANSFER*/
    std::cout << "HOST -> DEVICE" << std::endl;
    htod = clock();
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_parameters}, 0 /* 0 means from host*/));
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_operations}, 0 /* 0 means from host*/));
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_hbm}, 0 /* 0 means from host*/));
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
    // OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_output}, CL_MIGRATE_MEM_OBJECT_HOST));
    q.finish();
    dtoh = clock() - dtoh;

    /*====================================================VERIFICATION & TIMING===============================================================*/

    printf("Host -> Device : %lf ms\n", 1000.0 * htod / CLOCKS_PER_SEC);
    printf("Device -> Host : %lf ms\n", 1000.0 * dtoh / CLOCKS_PER_SEC);
    printf("Computation : %lf ms\n", 1000.0 * comp / CLOCKS_PER_SEC);

    std::cout << std::endl
              << "FIN" << std::endl;
    return 0;
}
