set moduleName memory_manager_Pipeline_VITIS_LOOP_809_26
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_809_26}
set C_modelType { void 0 }
set C_modelArgList {
	{ trunc_ln812_1 int 31 regular  }
	{ sext_ln812 int 32 regular  }
	{ or_ln812 int 32 regular  }
	{ HBM_PTR int 64 regular  }
	{ child_parent_1 int 32 regular  }
	{ trunc_ln12 int 6 regular  }
	{ gmem int 512 regular {axi_master 2}  }
	{ node_child int 32 regular {array 6 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "trunc_ln812_1", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln812", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "or_ln812", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "HBM_PTR", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "child_parent_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln12", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "HBM_PTR","offset": { "type": "dynamic","port_name": "HBM_PTR","bundle": "control"},"direction": "READWRITE"},{"cName": "operations","offset": { "type": "dynamic","port_name": "operations","bundle": "control"},"direction": "READONLY"},{"cName": "parameters_for_operations","offset": { "type": "dynamic","port_name": "parameters_for_operations","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "node_child", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 63
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 512 signal 6 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 512 signal 6 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_RFIFONUM sc_in sc_lv 9 signal 6 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 6 } 
	{ trunc_ln812_1 sc_in sc_lv 31 signal 0 } 
	{ sext_ln812 sc_in sc_lv 32 signal 1 } 
	{ or_ln812 sc_in sc_lv 32 signal 2 } 
	{ HBM_PTR sc_in sc_lv 64 signal 3 } 
	{ child_parent_1 sc_in sc_lv 32 signal 4 } 
	{ trunc_ln12 sc_in sc_lv 6 signal 5 } 
	{ node_child_address0 sc_out sc_lv 3 signal 7 } 
	{ node_child_ce0 sc_out sc_logic 1 signal 7 } 
	{ node_child_we0 sc_out sc_logic 1 signal 7 } 
	{ node_child_d0 sc_out sc_lv 32 signal 7 } 
	{ node_child_q0 sc_in sc_lv 32 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }} , 
 	{ "name": "trunc_ln812_1", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "trunc_ln812_1", "role": "default" }} , 
 	{ "name": "sext_ln812", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln812", "role": "default" }} , 
 	{ "name": "or_ln812", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "or_ln812", "role": "default" }} , 
 	{ "name": "HBM_PTR", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "HBM_PTR", "role": "default" }} , 
 	{ "name": "child_parent_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "child_parent_1", "role": "default" }} , 
 	{ "name": "trunc_ln12", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trunc_ln12", "role": "default" }} , 
 	{ "name": "node_child_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "node_child", "role": "address0" }} , 
 	{ "name": "node_child_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_child", "role": "ce0" }} , 
 	{ "name": "node_child_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_child", "role": "we0" }} , 
 	{ "name": "node_child_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_child", "role": "d0" }} , 
 	{ "name": "node_child_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_child", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_809_26",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "149", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "trunc_ln812_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln812", "Type" : "None", "Direction" : "I"},
			{"Name" : "or_ln812", "Type" : "None", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "child_parent_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_809_26", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "145", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_809_26 {
		trunc_ln812_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln812 {Type I LastRead 0 FirstWrite -1}
		or_ln812 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 81 FirstWrite 76}
		node_child {Type IO LastRead 0 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "149", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "149", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	trunc_ln812_1 { ap_none {  { trunc_ln812_1 in_data 0 31 } } }
	sext_ln812 { ap_none {  { sext_ln812 in_data 0 32 } } }
	or_ln812 { ap_none {  { or_ln812 in_data 0 32 } } }
	HBM_PTR { ap_none {  { HBM_PTR in_data 0 64 } } }
	child_parent_1 { ap_none {  { child_parent_1 in_data 0 32 } } }
	trunc_ln12 { ap_none {  { trunc_ln12 in_data 0 6 } } }
	 { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 32 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 512 }  { m_axi_gmem_WSTRB STRB 1 64 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 32 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 512 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RFIFONUM LEN 0 9 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
	node_child { ap_memory {  { node_child_address0 mem_address 1 3 }  { node_child_ce0 mem_ce 1 1 }  { node_child_we0 mem_we 1 1 }  { node_child_d0 mem_din 1 32 }  { node_child_q0 in_data 0 32 } } }
}
set moduleName memory_manager_Pipeline_VITIS_LOOP_809_26
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
set C_modelName {memory_manager_Pipeline_VITIS_LOOP_809_26}
set C_modelType { void 0 }
set C_modelArgList {
	{ trunc_ln812_1 int 31 regular  }
	{ sext_ln812 int 32 regular  }
	{ or_ln812 int 32 regular  }
	{ HBM_PTR int 64 regular  }
	{ child_parent_1 int 32 regular  }
	{ trunc_ln12 int 6 regular  }
	{ gmem int 512 regular {axi_master 2}  }
	{ node_child int 32 regular {array 6 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "trunc_ln812_1", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln812", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "or_ln812", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "HBM_PTR", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "child_parent_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln12", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "HBM_PTR","offset": { "type": "dynamic","port_name": "HBM_PTR","bundle": "control"},"direction": "READWRITE"},{"cName": "operations","offset": { "type": "dynamic","port_name": "operations","bundle": "control"},"direction": "READONLY"},{"cName": "parameters_for_operations","offset": { "type": "dynamic","port_name": "parameters_for_operations","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "node_child", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 63
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 512 signal 6 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 512 signal 6 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_RFIFONUM sc_in sc_lv 9 signal 6 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 6 } 
	{ trunc_ln812_1 sc_in sc_lv 31 signal 0 } 
	{ sext_ln812 sc_in sc_lv 32 signal 1 } 
	{ or_ln812 sc_in sc_lv 32 signal 2 } 
	{ HBM_PTR sc_in sc_lv 64 signal 3 } 
	{ child_parent_1 sc_in sc_lv 32 signal 4 } 
	{ trunc_ln12 sc_in sc_lv 6 signal 5 } 
	{ node_child_address0 sc_out sc_lv 3 signal 7 } 
	{ node_child_ce0 sc_out sc_logic 1 signal 7 } 
	{ node_child_we0 sc_out sc_logic 1 signal 7 } 
	{ node_child_d0 sc_out sc_lv 32 signal 7 } 
	{ node_child_q0 sc_in sc_lv 32 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }} , 
 	{ "name": "trunc_ln812_1", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "trunc_ln812_1", "role": "default" }} , 
 	{ "name": "sext_ln812", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln812", "role": "default" }} , 
 	{ "name": "or_ln812", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "or_ln812", "role": "default" }} , 
 	{ "name": "HBM_PTR", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "HBM_PTR", "role": "default" }} , 
 	{ "name": "child_parent_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "child_parent_1", "role": "default" }} , 
 	{ "name": "trunc_ln12", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "trunc_ln12", "role": "default" }} , 
 	{ "name": "node_child_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "node_child", "role": "address0" }} , 
 	{ "name": "node_child_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_child", "role": "ce0" }} , 
 	{ "name": "node_child_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_child", "role": "we0" }} , 
 	{ "name": "node_child_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_child", "role": "d0" }} , 
 	{ "name": "node_child_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_child", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_809_26",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "149", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "trunc_ln812_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln812", "Type" : "None", "Direction" : "I"},
			{"Name" : "or_ln812", "Type" : "None", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "child_parent_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_809_26", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "145", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager_Pipeline_VITIS_LOOP_809_26 {
		trunc_ln812_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln812 {Type I LastRead 0 FirstWrite -1}
		or_ln812 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 81 FirstWrite 76}
		node_child {Type IO LastRead 0 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "149", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "149", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	trunc_ln812_1 { ap_none {  { trunc_ln812_1 in_data 0 31 } } }
	sext_ln812 { ap_none {  { sext_ln812 in_data 0 32 } } }
	or_ln812 { ap_none {  { or_ln812 in_data 0 32 } } }
	HBM_PTR { ap_none {  { HBM_PTR in_data 0 64 } } }
	child_parent_1 { ap_none {  { child_parent_1 in_data 0 32 } } }
	trunc_ln12 { ap_none {  { trunc_ln12 in_data 0 6 } } }
	 { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 32 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 512 }  { m_axi_gmem_WSTRB STRB 1 64 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 32 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 512 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RFIFONUM LEN 0 9 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
	node_child { ap_memory {  { node_child_address0 mem_address 1 3 }  { node_child_ce0 mem_ce 1 1 }  { node_child_we0 mem_we 1 1 }  { node_child_d0 mem_din 1 32 }  { node_child_q0 in_data 0 32 } } }
}
