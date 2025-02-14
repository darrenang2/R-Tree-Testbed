set moduleName memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ mul_ln496 int 96 regular  }
	{ sext_ln17 int 32 regular  }
	{ OverlapEnlargementArray_overlapEnlargement int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
	{ OverlapEnlargementArray_index int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln496", "interface" : "wire", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln17", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "OverlapEnlargementArray_overlapEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "OverlapEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln496 sc_in sc_lv 96 signal 0 } 
	{ sext_ln17 sc_in sc_lv 32 signal 1 } 
	{ OverlapEnlargementArray_overlapEnlargement_address0 sc_out sc_lv 7 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_ce0 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_we0 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_d0 sc_out sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_q0 sc_in sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_address1 sc_out sc_lv 7 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_ce1 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_we1 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_d1 sc_out sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_q1 sc_in sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ OverlapEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_q0 sc_in sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_address1 sc_out sc_lv 7 signal 3 } 
	{ OverlapEnlargementArray_index_ce1 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_we1 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_d1 sc_out sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_q1 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln496", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "mul_ln496", "role": "default" }} , 
 	{ "name": "sext_ln17", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln17", "role": "default" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "address0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "ce0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "we0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "d0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "q0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "address1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "ce1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "we1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "d1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "q1" }} , 
 	{ "name": "OverlapEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "OverlapEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "OverlapEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "OverlapEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "OverlapEnlargementArray_index_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "q0" }} , 
 	{ "name": "OverlapEnlargementArray_index_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "address1" }} , 
 	{ "name": "OverlapEnlargementArray_index_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "ce1" }} , 
 	{ "name": "OverlapEnlargementArray_index_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "we1" }} , 
 	{ "name": "OverlapEnlargementArray_index_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "d1" }} , 
 	{ "name": "OverlapEnlargementArray_index_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln496", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln17", "Type" : "None", "Direction" : "I"},
			{"Name" : "OverlapEnlargementArray_overlapEnlargement", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "OverlapEnlargementArray_index", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_17_1_VITIS_LOOP_19_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 {
		mul_ln496 {Type I LastRead 0 FirstWrite -1}
		sext_ln17 {Type I LastRead 0 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead 3 FirstWrite 3}
		OverlapEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln496 { ap_none {  { mul_ln496 in_data 0 96 } } }
	sext_ln17 { ap_none {  { sext_ln17 in_data 0 32 } } }
	OverlapEnlargementArray_overlapEnlargement { ap_memory {  { OverlapEnlargementArray_overlapEnlargement_address0 mem_address 1 7 }  { OverlapEnlargementArray_overlapEnlargement_ce0 mem_ce 1 1 }  { OverlapEnlargementArray_overlapEnlargement_we0 mem_we 1 1 }  { OverlapEnlargementArray_overlapEnlargement_d0 mem_din 1 32 }  { OverlapEnlargementArray_overlapEnlargement_q0 in_data 0 32 }  { OverlapEnlargementArray_overlapEnlargement_address1 MemPortADDR2 1 7 }  { OverlapEnlargementArray_overlapEnlargement_ce1 MemPortCE2 1 1 }  { OverlapEnlargementArray_overlapEnlargement_we1 MemPortWE2 1 1 }  { OverlapEnlargementArray_overlapEnlargement_d1 MemPortDIN2 1 32 }  { OverlapEnlargementArray_overlapEnlargement_q1 in_data 0 32 } } }
	OverlapEnlargementArray_index { ap_memory {  { OverlapEnlargementArray_index_address0 mem_address 1 7 }  { OverlapEnlargementArray_index_ce0 mem_ce 1 1 }  { OverlapEnlargementArray_index_we0 mem_we 1 1 }  { OverlapEnlargementArray_index_d0 mem_din 1 32 }  { OverlapEnlargementArray_index_q0 in_data 0 32 }  { OverlapEnlargementArray_index_address1 MemPortADDR2 1 7 }  { OverlapEnlargementArray_index_ce1 MemPortCE2 1 1 }  { OverlapEnlargementArray_index_we1 MemPortWE2 1 1 }  { OverlapEnlargementArray_index_d1 MemPortDIN2 1 32 }  { OverlapEnlargementArray_index_q1 in_data 0 32 } } }
}
set moduleName memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ mul_ln496 int 96 regular  }
	{ sext_ln17 int 32 regular  }
	{ OverlapEnlargementArray_overlapEnlargement int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
	{ OverlapEnlargementArray_index int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln496", "interface" : "wire", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln17", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "OverlapEnlargementArray_overlapEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "OverlapEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln496 sc_in sc_lv 96 signal 0 } 
	{ sext_ln17 sc_in sc_lv 32 signal 1 } 
	{ OverlapEnlargementArray_overlapEnlargement_address0 sc_out sc_lv 7 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_ce0 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_we0 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_d0 sc_out sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_q0 sc_in sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_address1 sc_out sc_lv 7 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_ce1 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_we1 sc_out sc_logic 1 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_d1 sc_out sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_overlapEnlargement_q1 sc_in sc_lv 32 signal 2 } 
	{ OverlapEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ OverlapEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_q0 sc_in sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_address1 sc_out sc_lv 7 signal 3 } 
	{ OverlapEnlargementArray_index_ce1 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_we1 sc_out sc_logic 1 signal 3 } 
	{ OverlapEnlargementArray_index_d1 sc_out sc_lv 32 signal 3 } 
	{ OverlapEnlargementArray_index_q1 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln496", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "mul_ln496", "role": "default" }} , 
 	{ "name": "sext_ln17", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln17", "role": "default" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "address0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "ce0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "we0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "d0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "q0" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "address1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "ce1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "we1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "d1" }} , 
 	{ "name": "OverlapEnlargementArray_overlapEnlargement_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_overlapEnlargement", "role": "q1" }} , 
 	{ "name": "OverlapEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "OverlapEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "OverlapEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "OverlapEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "OverlapEnlargementArray_index_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "q0" }} , 
 	{ "name": "OverlapEnlargementArray_index_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "address1" }} , 
 	{ "name": "OverlapEnlargementArray_index_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "ce1" }} , 
 	{ "name": "OverlapEnlargementArray_index_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "we1" }} , 
 	{ "name": "OverlapEnlargementArray_index_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "d1" }} , 
 	{ "name": "OverlapEnlargementArray_index_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OverlapEnlargementArray_index", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln496", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln17", "Type" : "None", "Direction" : "I"},
			{"Name" : "OverlapEnlargementArray_overlapEnlargement", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "OverlapEnlargementArray_index", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_17_1_VITIS_LOOP_19_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 {
		mul_ln496 {Type I LastRead 0 FirstWrite -1}
		sext_ln17 {Type I LastRead 0 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead 3 FirstWrite 3}
		OverlapEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln496 { ap_none {  { mul_ln496 in_data 0 96 } } }
	sext_ln17 { ap_none {  { sext_ln17 in_data 0 32 } } }
	OverlapEnlargementArray_overlapEnlargement { ap_memory {  { OverlapEnlargementArray_overlapEnlargement_address0 mem_address 1 7 }  { OverlapEnlargementArray_overlapEnlargement_ce0 mem_ce 1 1 }  { OverlapEnlargementArray_overlapEnlargement_we0 mem_we 1 1 }  { OverlapEnlargementArray_overlapEnlargement_d0 mem_din 1 32 }  { OverlapEnlargementArray_overlapEnlargement_q0 in_data 0 32 }  { OverlapEnlargementArray_overlapEnlargement_address1 MemPortADDR2 1 7 }  { OverlapEnlargementArray_overlapEnlargement_ce1 MemPortCE2 1 1 }  { OverlapEnlargementArray_overlapEnlargement_we1 MemPortWE2 1 1 }  { OverlapEnlargementArray_overlapEnlargement_d1 MemPortDIN2 1 32 }  { OverlapEnlargementArray_overlapEnlargement_q1 in_data 0 32 } } }
	OverlapEnlargementArray_index { ap_memory {  { OverlapEnlargementArray_index_address0 mem_address 1 7 }  { OverlapEnlargementArray_index_ce0 mem_ce 1 1 }  { OverlapEnlargementArray_index_we0 mem_we 1 1 }  { OverlapEnlargementArray_index_d0 mem_din 1 32 }  { OverlapEnlargementArray_index_q0 in_data 0 32 }  { OverlapEnlargementArray_index_address1 MemPortADDR2 1 7 }  { OverlapEnlargementArray_index_ce1 MemPortCE2 1 1 }  { OverlapEnlargementArray_index_we1 MemPortWE2 1 1 }  { OverlapEnlargementArray_index_d1 MemPortDIN2 1 32 }  { OverlapEnlargementArray_index_q1 in_data 0 32 } } }
}
