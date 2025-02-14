cmake_minimum_required(VERSION 3.0)

set (PROJECT_NAME krnl)
project(${PROJECT_NAME})

# Include custom Find<Module>.cmake scripts to enable searching for Vivado HLS
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)



set(FPGA_PART xcu280-fsvh2892-2L-e CACHE STRING "FPGA part")
set(CLOCK_PERIOD 300.000000MHz CACHE STRING "Target clock period in nanoseconds")


# Installation directory
if (DEFINED ENV{IPREPO_DIR})
   set(IPREPO_DIR $ENV{IPREPO_DIR})
elseif(NOT  IPREPO_DIR)
   set(IPREPO_DIR ${CMAKE_CURRENT_SOURCE_DIR}/iprepo/)
endif()


include_directories(${CMAKE_CURRENT_BINARY_DIR})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/make.tcl.in make.tcl)


set(EXAMPLE_HLS_DEPENDS
   
   # HLS
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/krnl.cpp 
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/krnlSearch.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/krnlInsert.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/mem_mngr.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/node.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/overlapEnlargementPair.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/areaEnlargementPair.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/nodeArray.cpp

   # Testbed
   ${CMAKE_CURRENT_SOURCE_DIR}/hls/test_krnl.cpp

   # inclues 
   ${CMAKE_CURRENT_SOURCE_DIR}/include/krnlSearch.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/mem_mngr.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/constants.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/stack.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/node.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/overlapEnlargementPair.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/areaEnlargementPair.h
   ${CMAKE_CURRENT_SOURCE_DIR}/include/nodeArray.h
    
)


#Setup HLS custom targets
set(HLS_TARGETS synthesis csim cosim ip installip)

foreach (target ${HLS_TARGETS})
   if (NOT TARGET ${target})
      add_custom_target(${target})
   endif()

   add_custom_target(${target}.${PROJECT_NAME}
      COMMAND ${VITIS_HLS_BINARY} -f make.tcl -tclargs ${target}
      DEPENDS ${EXAMPLE_HLS_DEPENDS})
   add_dependencies(${target} ${target}.${PROJECT_NAME})
endforeach()

#target dependencies
add_dependencies(cosim.${PROJECT_NAME} synthesis.${PROJECT_NAME})
add_dependencies(ip.${PROJECT_NAME} synthesis.${PROJECT_NAME})
add_dependencies(installip.${PROJECT_NAME} ip.${PROJECT_NAME})
