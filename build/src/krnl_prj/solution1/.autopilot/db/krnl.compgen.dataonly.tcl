# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
HBM_PTR { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
operations { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
parameters_for_operations { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
number_of_operations { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 52
	offset_end 59
}
board_num { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
exe { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 68
	offset_end 75
}
}
dict set axilite_register_dict control $port_control


