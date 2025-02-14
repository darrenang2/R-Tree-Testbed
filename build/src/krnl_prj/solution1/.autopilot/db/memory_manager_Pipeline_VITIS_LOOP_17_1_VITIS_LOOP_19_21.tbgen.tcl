set moduleName memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21}
set C_modelType { void 0 }
set C_modelArgList {
	{ mul_ln520 int 96 regular  }
	{ sext_ln17_1 int 32 regular  }
	{ AreaEnlargementArray_areaEnlargement int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
	{ AreaEnlargementArray_index int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln520", "interface" : "wire", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln17_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "AreaEnlargementArray_areaEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln520 sc_in sc_lv 96 signal 0 } 
	{ sext_ln17_1 sc_in sc_lv 32 signal 1 } 
	{ AreaEnlargementArray_areaEnlargement_address0 sc_out sc_lv 7 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_ce0 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_we0 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_d0 sc_out sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_q0 sc_in sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_address1 sc_out sc_lv 7 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_ce1 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_we1 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_d1 sc_out sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_q1 sc_in sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_q0 sc_in sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_address1 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce1 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we1 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d1 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_q1 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln520", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "mul_ln520", "role": "default" }} , 
 	{ "name": "sext_ln17_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln17_1", "role": "default" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "q0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "q1" }} , 
 	{ "name": "AreaEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_index_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "q0" }} , 
 	{ "name": "AreaEnlargementArray_index_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address1" }} , 
 	{ "name": "AreaEnlargementArray_index_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce1" }} , 
 	{ "name": "AreaEnlargementArray_index_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we1" }} , 
 	{ "name": "AreaEnlargementArray_index_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d1" }} , 
 	{ "name": "AreaEnlargementArray_index_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21",
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
			{"Name" : "mul_ln520", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln17_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_17_1_VITIS_LOOP_19_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 {
		mul_ln520 {Type I LastRead 0 FirstWrite -1}
		sext_ln17_1 {Type I LastRead 0 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead 3 FirstWrite 3}
		AreaEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln520 { ap_none {  { mul_ln520 in_data 0 96 } } }
	sext_ln17_1 { ap_none {  { sext_ln17_1 in_data 0 32 } } }
	AreaEnlargementArray_areaEnlargement { ap_memory {  { AreaEnlargementArray_areaEnlargement_address0 mem_address 1 7 }  { AreaEnlargementArray_areaEnlargement_ce0 mem_ce 1 1 }  { AreaEnlargementArray_areaEnlargement_we0 mem_we 1 1 }  { AreaEnlargementArray_areaEnlargement_d0 mem_din 1 32 }  { AreaEnlargementArray_areaEnlargement_q0 in_data 0 32 }  { AreaEnlargementArray_areaEnlargement_address1 MemPortADDR2 1 7 }  { AreaEnlargementArray_areaEnlargement_ce1 MemPortCE2 1 1 }  { AreaEnlargementArray_areaEnlargement_we1 MemPortWE2 1 1 }  { AreaEnlargementArray_areaEnlargement_d1 MemPortDIN2 1 32 }  { AreaEnlargementArray_areaEnlargement_q1 in_data 0 32 } } }
	AreaEnlargementArray_index { ap_memory {  { AreaEnlargementArray_index_address0 mem_address 1 7 }  { AreaEnlargementArray_index_ce0 mem_ce 1 1 }  { AreaEnlargementArray_index_we0 mem_we 1 1 }  { AreaEnlargementArray_index_d0 mem_din 1 32 }  { AreaEnlargementArray_index_q0 in_data 0 32 }  { AreaEnlargementArray_index_address1 MemPortADDR2 1 7 }  { AreaEnlargementArray_index_ce1 MemPortCE2 1 1 }  { AreaEnlargementArray_index_we1 MemPortWE2 1 1 }  { AreaEnlargementArray_index_d1 MemPortDIN2 1 32 }  { AreaEnlargementArray_index_q1 in_data 0 32 } } }
}
set moduleName memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21}
set C_modelType { void 0 }
set C_modelArgList {
	{ mul_ln520 int 96 regular  }
	{ sext_ln17_1 int 32 regular  }
	{ AreaEnlargementArray_areaEnlargement int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
	{ AreaEnlargementArray_index int 32 regular {array 100 { 2 2 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln520", "interface" : "wire", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln17_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "AreaEnlargementArray_areaEnlargement", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "AreaEnlargementArray_index", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln520 sc_in sc_lv 96 signal 0 } 
	{ sext_ln17_1 sc_in sc_lv 32 signal 1 } 
	{ AreaEnlargementArray_areaEnlargement_address0 sc_out sc_lv 7 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_ce0 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_we0 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_d0 sc_out sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_q0 sc_in sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_address1 sc_out sc_lv 7 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_ce1 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_we1 sc_out sc_logic 1 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_d1 sc_out sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_areaEnlargement_q1 sc_in sc_lv 32 signal 2 } 
	{ AreaEnlargementArray_index_address0 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we0 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d0 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_q0 sc_in sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_address1 sc_out sc_lv 7 signal 3 } 
	{ AreaEnlargementArray_index_ce1 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_we1 sc_out sc_logic 1 signal 3 } 
	{ AreaEnlargementArray_index_d1 sc_out sc_lv 32 signal 3 } 
	{ AreaEnlargementArray_index_q1 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln520", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "mul_ln520", "role": "default" }} , 
 	{ "name": "sext_ln17_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln17_1", "role": "default" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "q0" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "address1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "ce1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "we1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "d1" }} , 
 	{ "name": "AreaEnlargementArray_areaEnlargement_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_areaEnlargement", "role": "q1" }} , 
 	{ "name": "AreaEnlargementArray_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address0" }} , 
 	{ "name": "AreaEnlargementArray_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce0" }} , 
 	{ "name": "AreaEnlargementArray_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we0" }} , 
 	{ "name": "AreaEnlargementArray_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d0" }} , 
 	{ "name": "AreaEnlargementArray_index_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "q0" }} , 
 	{ "name": "AreaEnlargementArray_index_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "address1" }} , 
 	{ "name": "AreaEnlargementArray_index_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "ce1" }} , 
 	{ "name": "AreaEnlargementArray_index_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "we1" }} , 
 	{ "name": "AreaEnlargementArray_index_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "d1" }} , 
 	{ "name": "AreaEnlargementArray_index_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AreaEnlargementArray_index", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21",
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
			{"Name" : "mul_ln520", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln17_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_17_1_VITIS_LOOP_19_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 {
		mul_ln520 {Type I LastRead 0 FirstWrite -1}
		sext_ln17_1 {Type I LastRead 0 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead 3 FirstWrite 3}
		AreaEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln520 { ap_none {  { mul_ln520 in_data 0 96 } } }
	sext_ln17_1 { ap_none {  { sext_ln17_1 in_data 0 32 } } }
	AreaEnlargementArray_areaEnlargement { ap_memory {  { AreaEnlargementArray_areaEnlargement_address0 mem_address 1 7 }  { AreaEnlargementArray_areaEnlargement_ce0 mem_ce 1 1 }  { AreaEnlargementArray_areaEnlargement_we0 mem_we 1 1 }  { AreaEnlargementArray_areaEnlargement_d0 mem_din 1 32 }  { AreaEnlargementArray_areaEnlargement_q0 in_data 0 32 }  { AreaEnlargementArray_areaEnlargement_address1 MemPortADDR2 1 7 }  { AreaEnlargementArray_areaEnlargement_ce1 MemPortCE2 1 1 }  { AreaEnlargementArray_areaEnlargement_we1 MemPortWE2 1 1 }  { AreaEnlargementArray_areaEnlargement_d1 MemPortDIN2 1 32 }  { AreaEnlargementArray_areaEnlargement_q1 in_data 0 32 } } }
	AreaEnlargementArray_index { ap_memory {  { AreaEnlargementArray_index_address0 mem_address 1 7 }  { AreaEnlargementArray_index_ce0 mem_ce 1 1 }  { AreaEnlargementArray_index_we0 mem_we 1 1 }  { AreaEnlargementArray_index_d0 mem_din 1 32 }  { AreaEnlargementArray_index_q0 in_data 0 32 }  { AreaEnlargementArray_index_address1 MemPortADDR2 1 7 }  { AreaEnlargementArray_index_ce1 MemPortCE2 1 1 }  { AreaEnlargementArray_index_we1 MemPortWE2 1 1 }  { AreaEnlargementArray_index_d1 MemPortDIN2 1 32 }  { AreaEnlargementArray_index_q1 in_data 0 32 } } }
}
