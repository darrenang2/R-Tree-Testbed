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


add_files /home/dang004/R-Tree-Testbed/src/krnl.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_files -tb /home/dang004/R-Tree-Testbed/src/test_krnl.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_files /home/dang004/R-Tree-Testbed/src/krnlSearch.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_files /home/dang004/R-Tree-Testbed/src/mem_mngr.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_file /home/dang004/R-Tree-Testbed/src/node.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_file /home/dang004/R-Tree-Testbed/src/nodeArray.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_file /home/dang004/R-Tree-Testbed/src/overlapEnlargementPair.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_file /home/dang004/R-Tree-Testbed/src/areaEnlargementPair.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"
add_files /home/dang004/R-Tree-Testbed/src/krnlInsert.cpp -cflags "-I/home/dang004/R-Tree-Testbed/build/src/../../include"


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design 
} elseif {$command == "ip"} {
   export_design -format xo
} elseif {$command == "installip"} {
   file mkdir /home/dang004/R-Tree-Testbed/build/iprepo
   file copy -force /home/dang004/R-Tree-Testbed/build/src/krnl_prj/solution1/impl/export.xo /home/dang004/R-Tree-Testbed/build/iprepo/krnl.xo
}  else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip|installip> ."
}


exit
