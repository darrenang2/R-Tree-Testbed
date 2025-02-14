set moduleName memory_manager_Pipeline_VITIS_LOOP_505_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_505_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ pair_areaEnlargement int 32 regular  }
	{ curNode_child int 32 regular {array 6 { 1 3 } 1 1 }  }
	{ array_size int 32 regular {pointer 2} {global 2}  }
	{ AreaEnlargementArray_index int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ AreaEnlargementArray_areaEnlargement int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "pair_areaEnlargement", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "curNode_child", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_areaEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pair_areaEnlargement sc_in sc_lv 32 signal 0 } 
	{ curNode_child_address0 sc_out sc_lv 3 signal 1 } 
	{ curNode_child_ce0 sc_out sc_logic 1 signal 1 } 
	{ curNode_child_q0 sc_in sc_lv 32 signal 1 } 
	{ array_size_i sc_in sc_lv 32 signal 2 } 
	{ array_size_o sc_out sc_lv 32 signal 2 } 
	{ array_size_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ AreaEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_areaEnlargement_address0 sc_out sc_lv 7 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_ce0 sc_out sc_logic 1 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_we0 sc_out sc_logic 1 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_d0 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pair_areaEnlargement", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pair_areaEnlargement", "role": "default" }} , 
 	{ "name": "curNode_child_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "curNode_child", "role": "address0" }} , 
 	{ "name": "curNode_child_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curNode_child", "role": "ce0" }} , 
 	{ "name": "curNode_child_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "curNode_child", "role": "q0" }} , 
 	{ "name": "array_size_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_size", "role": "i" }} , 
 	{ "name": "array_size_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_size", "role": "o" }} , 
 	{ "name": "array_size_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "array_size", "role": "o_ap_vld" }} , 
 	{ "name": "AreaEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_505_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "15",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pair_areaEnlargement", "Type" : "None", "Direction" : "I"},
			{"Name" : "curNode_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "array_size", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_505_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_505_3 {
		pair_areaEnlargement {Type I LastRead 0 FirstWrite -1}
		curNode_child {Type I LastRead 0 FirstWrite -1}
		array_size {Type IO LastRead 1 FirstWrite 1}
		AreaEnlargementArray_index {Type O LastRead -1 FirstWrite 1}
		AreaEnlargementArray_areaEnlargement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "15"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "15"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	pair_areaEnlargement { ap_none {  { pair_areaEnlargement in_data 0 32 } } }
	curNode_child { ap_memory {  { curNode_child_address0 mem_address 1 3 }  { curNode_child_ce0 mem_ce 1 1 }  { curNode_child_q0 in_data 0 32 } } }
	array_size { ap_ovld {  { array_size_i in_data 0 32 }  { array_size_o out_data 1 32 }  { array_size_o_ap_vld out_vld 1 1 } } }
	AreaEnlargementArray_index { ap_memory {  { AreaEnlargementArray_index_address0 mem_address 1 7 }  { AreaEnlargementArray_index_ce0 mem_ce 1 1 }  { AreaEnlargementArray_index_we0 mem_we 1 1 }  { AreaEnlargementArray_index_d0 mem_din 1 32 } } }
	AreaEnlargementArray_areaEnlargement { ap_memory {  { AreaEnlargementArray_areaEnlargement_address0 mem_address 1 7 }  { AreaEnlargementArray_areaEnlargement_ce0 mem_ce 1 1 }  { AreaEnlargementArray_areaEnlargement_we0 mem_we 1 1 }  { AreaEnlargementArray_areaEnlargement_d0 mem_din 1 32 } } }
}
set moduleName memory_manager_Pipeline_VITIS_LOOP_505_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_505_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ pair_areaEnlargement int 32 regular  }
	{ curNode_child int 32 regular {array 6 { 1 3 } 1 1 }  }
	{ array_size int 32 regular {pointer 2} {global 2}  }
	{ AreaEnlargementArray_index int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ AreaEnlargementArray_areaEnlargement int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "pair_areaEnlargement", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "curNode_child", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_areaEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pair_areaEnlargement sc_in sc_lv 32 signal 0 } 
	{ curNode_child_address0 sc_out sc_lv 3 signal 1 } 
	{ curNode_child_ce0 sc_out sc_logic 1 signal 1 } 
	{ curNode_child_q0 sc_in sc_lv 32 signal 1 } 
	{ array_size_i sc_in sc_lv 32 signal 2 } 
	{ array_size_o sc_out sc_lv 32 signal 2 } 
	{ array_size_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ AreaEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_areaEnlargement_address0 sc_out sc_lv 7 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_ce0 sc_out sc_logic 1 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_we0 sc_out sc_logic 1 signal 4 } 
	{ AreaEnlargementArray_areaEnlargement_d0 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pair_areaEnlargement", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pair_areaEnlargement", "role": "default" }} , 
 	{ "name": "curNode_child_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "curNode_child", "role": "address0" }} , 
 	{ "name": "curNode_child_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curNode_child", "role": "ce0" }} , 
 	{ "name": "curNode_child_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "curNode_child", "role": "q0" }} , 
 	{ "name": "array_size_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_size", "role": "i" }} , 
 	{ "name": "array_size_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_size", "role": "o" }} , 
 	{ "name": "array_size_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "array_size", "role": "o_ap_vld" }} , 
 	{ "name": "AreaEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_505_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "15",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pair_areaEnlargement", "Type" : "None", "Direction" : "I"},
			{"Name" : "curNode_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "array_size", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_505_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_505_3 {
		pair_areaEnlargement {Type I LastRead 0 FirstWrite -1}
		curNode_child {Type I LastRead 0 FirstWrite -1}
		array_size {Type IO LastRead 1 FirstWrite 1}
		AreaEnlargementArray_index {Type O LastRead -1 FirstWrite 1}
		AreaEnlargementArray_areaEnlargement {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "15"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "15"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	pair_areaEnlargement { ap_none {  { pair_areaEnlargement in_data 0 32 } } }
	curNode_child { ap_memory {  { curNode_child_address0 mem_address 1 3 }  { curNode_child_ce0 mem_ce 1 1 }  { curNode_child_q0 in_data 0 32 } } }
	array_size { ap_ovld {  { array_size_i in_data 0 32 }  { array_size_o out_data 1 32 }  { array_size_o_ap_vld out_vld 1 1 } } }
	AreaEnlargementArray_index { ap_memory {  { AreaEnlargementArray_index_address0 mem_address 1 7 }  { AreaEnlargementArray_index_ce0 mem_ce 1 1 }  { AreaEnlargementArray_index_we0 mem_we 1 1 }  { AreaEnlargementArray_index_d0 mem_din 1 32 } } }
	AreaEnlargementArray_areaEnlargement { ap_memory {  { AreaEnlargementArray_areaEnlargement_address0 mem_address 1 7 }  { AreaEnlargementArray_areaEnlargement_ce0 mem_ce 1 1 }  { AreaEnlargementArray_areaEnlargement_we0 mem_we 1 1 }  { AreaEnlargementArray_areaEnlargement_d0 mem_din 1 32 } } }
}
