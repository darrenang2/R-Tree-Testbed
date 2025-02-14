if { [info exists ::env(LIBRARY_PATH)] } {
    set ::env(LIBRARY_PATH) /usr/lib/x86_64-linux-gnu:$env(LIBRARY_PATH)
} else {
    set ::env(LIBRARY_PATH) /usr/lib/x86_64-linux-gnu
}

open_project krnl_prj

open_solution "solution1"
set_part xcu280-fsvh2892-2L-e
create_clock -period 300.000000MHz -name default

set_top krnl

config_interface -m_axi_latency=64
config_interface -m_axi_alignment_byte_size=64
config_interface -m_axi_max_widen_bitwidth=512
config_rtl -register_reset_num=3


add_files /home/pyuva001/R-Tree-Testbed/src/hls/krnl.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files -tb /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
#add_files /home/pyuva001/R-Tree-Testbed/src/hls/krnlSearch.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/mem_mngr.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/node.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/nodeArray.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/overlapEnlargementPair.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/areaEnlargementPair.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
add_files /home/pyuva001/R-Tree-Testbed/src/hls/krnlInsert.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"
#add_files /home/pyuva001/R-Tree-Testbed/src/hls/krnlRemove.cpp -cflags "-I/home/pyuva001/R-Tree-Testbed/src/include"


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design 
} elseif {$command == "cosim"} {
   cosim_design 
} elseif {$command == "ip"} {
   export_design -format xo
} elseif {$command == "installip"} {
   file mkdir /home/pyuva001/R-Tree-Testbed/build/iprepo
   file copy -force /home/pyuva001/R-Tree-Testbed/build/src/krnl_prj/solution1/impl/export.xo /home/pyuva001/R-Tree-Testbed/build/iprepo/krnl.xo
}  else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip|installip> ."
}


exit
