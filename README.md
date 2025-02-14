# R-Tree on Alveo U280

This github is a R-Tree implementation designed for AMD Xilinx's Alveo U280. Currently provides single node operations such as insert, search, and remove with the Tree located in off-chip HBM (High Bandwidth Memory). 

The design was created with Vitis HLS 2022.2. 

## Installation 

```
git clone https://github.com/darrenang2/R-Tree-Testbed.git
cd R-Tree-Testbed
mkdir build
cd build
cmake ..
```


To run the R-Tree HLS (within the build directory):
### C Simulation
```
make csim
```
### RTL Simulation
```
make cosim
```

### IP Generation
Currently the IP is generated into the .XO format. The .XO will be located inside the *./build/iprepo/*.
```
make installip
```

