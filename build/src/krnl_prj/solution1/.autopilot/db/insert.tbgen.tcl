set moduleName insert
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {insert}
set C_modelType { void 0 }
set C_modelArgList {
	{ newLeaf2insert int 417 regular {fifo 0 volatile }  }
	{ insertNode4insert int 417 regular {fifo 1 volatile }  }
	{ getNode4insert2 int 32 regular {fifo 1 volatile }  }
	{ receiveNode4insert int 417 regular {fifo 0 volatile }  }
	{ writeChanges4insert int 417 regular {fifo 1 volatile }  }
	{ overflow2split int 417 regular {fifo 1 volatile }  }
	{ cst_req int 417 regular {fifo 1 volatile }  }
	{ split2overflow int 417 regular {fifo 0 volatile }  }
	{ insertFinished3 int 1 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "newLeaf2insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "insertNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "getNode4insert2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "receiveNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "writeChanges4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "overflow2split", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cst_req", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split2overflow", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "insertFinished3", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ newLeaf2insert_dout sc_in sc_lv 417 signal 0 } 
	{ newLeaf2insert_empty_n sc_in sc_logic 1 signal 0 } 
	{ newLeaf2insert_read sc_out sc_logic 1 signal 0 } 
	{ insertNode4insert_din sc_out sc_lv 417 signal 1 } 
	{ insertNode4insert_full_n sc_in sc_logic 1 signal 1 } 
	{ insertNode4insert_write sc_out sc_logic 1 signal 1 } 
	{ getNode4insert2_din sc_out sc_lv 32 signal 2 } 
	{ getNode4insert2_full_n sc_in sc_logic 1 signal 2 } 
	{ getNode4insert2_write sc_out sc_logic 1 signal 2 } 
	{ receiveNode4insert_dout sc_in sc_lv 417 signal 3 } 
	{ receiveNode4insert_empty_n sc_in sc_logic 1 signal 3 } 
	{ receiveNode4insert_read sc_out sc_logic 1 signal 3 } 
	{ writeChanges4insert_din sc_out sc_lv 417 signal 4 } 
	{ writeChanges4insert_full_n sc_in sc_logic 1 signal 4 } 
	{ writeChanges4insert_write sc_out sc_logic 1 signal 4 } 
	{ overflow2split_din sc_out sc_lv 417 signal 5 } 
	{ overflow2split_full_n sc_in sc_logic 1 signal 5 } 
	{ overflow2split_write sc_out sc_logic 1 signal 5 } 
	{ cst_req_din sc_out sc_lv 417 signal 6 } 
	{ cst_req_full_n sc_in sc_logic 1 signal 6 } 
	{ cst_req_write sc_out sc_logic 1 signal 6 } 
	{ split2overflow_dout sc_in sc_lv 417 signal 7 } 
	{ split2overflow_empty_n sc_in sc_logic 1 signal 7 } 
	{ split2overflow_read sc_out sc_logic 1 signal 7 } 
	{ insertFinished3_din sc_out sc_lv 1 signal 8 } 
	{ insertFinished3_full_n sc_in sc_logic 1 signal 8 } 
	{ insertFinished3_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "newLeaf2insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "dout" }} , 
 	{ "name": "newLeaf2insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "empty_n" }} , 
 	{ "name": "newLeaf2insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "read" }} , 
 	{ "name": "insertNode4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "din" }} , 
 	{ "name": "insertNode4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "full_n" }} , 
 	{ "name": "insertNode4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "write" }} , 
 	{ "name": "getNode4insert2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "din" }} , 
 	{ "name": "getNode4insert2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "full_n" }} , 
 	{ "name": "getNode4insert2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "write" }} , 
 	{ "name": "receiveNode4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "dout" }} , 
 	{ "name": "receiveNode4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "empty_n" }} , 
 	{ "name": "receiveNode4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "read" }} , 
 	{ "name": "writeChanges4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "din" }} , 
 	{ "name": "writeChanges4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "full_n" }} , 
 	{ "name": "writeChanges4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "write" }} , 
 	{ "name": "overflow2split_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "overflow2split", "role": "din" }} , 
 	{ "name": "overflow2split_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "full_n" }} , 
 	{ "name": "overflow2split_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "write" }} , 
 	{ "name": "cst_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "cst_req", "role": "din" }} , 
 	{ "name": "cst_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "full_n" }} , 
 	{ "name": "cst_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "write" }} , 
 	{ "name": "split2overflow_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "split2overflow", "role": "dout" }} , 
 	{ "name": "split2overflow_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "empty_n" }} , 
 	{ "name": "split2overflow_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "read" }} , 
 	{ "name": "insertFinished3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "din" }} , 
 	{ "name": "insertFinished3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "full_n" }} , 
 	{ "name": "insertFinished3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "insert",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "20",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newLeaf2insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "newLeaf2insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "insertNode4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "insertNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "getNode4insert2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "getNode4insert2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "receiveNode4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "receiveNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "writeChanges4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "writeChanges4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "overflow2split", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "overflow2split_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cst_req", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "cst_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "split2overflow", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "split2overflow_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "insertFinished3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "insertFinished3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "addLeaf", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "received", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_hasLeaves", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wait_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_parent", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_hasLeaves", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_amount_of_children", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_parent", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_minX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_maxX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_minY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_maxY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_amount_of_children", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_minX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_maxX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_minY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_maxY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "root_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "26", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state22_blk"}},
			{"Name" : "VITIS_LOOP_334_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "26", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state13", "ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12", "ap_ST_fsm_state15"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cur_child_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.root_child_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	insert {
		newLeaf2insert {Type I LastRead 1 FirstWrite -1}
		insertNode4insert {Type O LastRead -1 FirstWrite 5}
		getNode4insert2 {Type O LastRead -1 FirstWrite 6}
		receiveNode4insert {Type I LastRead 2 FirstWrite -1}
		writeChanges4insert {Type O LastRead -1 FirstWrite 8}
		overflow2split {Type O LastRead -1 FirstWrite 4}
		cst_req {Type O LastRead -1 FirstWrite 4}
		split2overflow {Type I LastRead 2 FirstWrite -1}
		insertFinished3 {Type O LastRead -1 FirstWrite 1}
		state {Type IO LastRead -1 FirstWrite -1}
		addLeaf {Type IO LastRead -1 FirstWrite -1}
		received {Type IO LastRead -1 FirstWrite -1}
		cur_hasLeaves {Type IO LastRead -1 FirstWrite -1}
		wait_r {Type IO LastRead -1 FirstWrite -1}
		newLeaf_index {Type IO LastRead -1 FirstWrite -1}
		newLeaf_parent {Type IO LastRead -1 FirstWrite -1}
		newLeaf_hasLeaves {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_5 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_4 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_3 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_2 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_1 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child {Type IO LastRead -1 FirstWrite -1}
		newLeaf_amount_of_children {Type IO LastRead -1 FirstWrite -1}
		cur_index {Type IO LastRead -1 FirstWrite -1}
		cur_parent {Type IO LastRead -1 FirstWrite -1}
		cur_box_minX {Type IO LastRead -1 FirstWrite -1}
		cur_box_maxX {Type IO LastRead -1 FirstWrite -1}
		cur_box_minY {Type IO LastRead -1 FirstWrite -1}
		cur_box_maxY {Type IO LastRead -1 FirstWrite -1}
		cur_amount_of_children {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_minX {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_maxX {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_minY {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_maxY {Type IO LastRead -1 FirstWrite -1}
		root_index {Type IO LastRead -1 FirstWrite -1}
		cur_child {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	newLeaf2insert { ap_fifo {  { newLeaf2insert_dout fifo_port_we 0 417 }  { newLeaf2insert_empty_n fifo_status 0 1 }  { newLeaf2insert_read fifo_data 1 1 } } }
	insertNode4insert { ap_fifo {  { insertNode4insert_din fifo_port_we 1 417 }  { insertNode4insert_full_n fifo_status 0 1 }  { insertNode4insert_write fifo_data 1 1 } } }
	getNode4insert2 { ap_fifo {  { getNode4insert2_din fifo_port_we 1 32 }  { getNode4insert2_full_n fifo_status 0 1 }  { getNode4insert2_write fifo_data 1 1 } } }
	receiveNode4insert { ap_fifo {  { receiveNode4insert_dout fifo_port_we 0 417 }  { receiveNode4insert_empty_n fifo_status 0 1 }  { receiveNode4insert_read fifo_data 1 1 } } }
	writeChanges4insert { ap_fifo {  { writeChanges4insert_din fifo_port_we 1 417 }  { writeChanges4insert_full_n fifo_status 0 1 }  { writeChanges4insert_write fifo_data 1 1 } } }
	overflow2split { ap_fifo {  { overflow2split_din fifo_port_we 1 417 }  { overflow2split_full_n fifo_status 0 1 }  { overflow2split_write fifo_data 1 1 } } }
	cst_req { ap_fifo {  { cst_req_din fifo_port_we 1 417 }  { cst_req_full_n fifo_status 0 1 }  { cst_req_write fifo_data 1 1 } } }
	split2overflow { ap_fifo {  { split2overflow_dout fifo_port_we 0 417 }  { split2overflow_empty_n fifo_status 0 1 }  { split2overflow_read fifo_data 1 1 } } }
	insertFinished3 { ap_fifo {  { insertFinished3_din fifo_port_we 1 1 }  { insertFinished3_full_n fifo_status 0 1 }  { insertFinished3_write fifo_data 1 1 } } }
}
set moduleName insert
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {insert}
set C_modelType { void 0 }
set C_modelArgList {
	{ newLeaf2insert int 417 regular {fifo 0 volatile }  }
	{ insertNode4insert int 417 regular {fifo 1 volatile }  }
	{ getNode4insert2 int 32 regular {fifo 1 volatile }  }
	{ receiveNode4insert int 417 regular {fifo 0 volatile }  }
	{ writeChanges4insert int 417 regular {fifo 1 volatile }  }
	{ overflow2split int 417 regular {fifo 1 volatile }  }
	{ cst_req int 417 regular {fifo 1 volatile }  }
	{ split2overflow int 417 regular {fifo 0 volatile }  }
	{ insertFinished3 int 1 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "newLeaf2insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "insertNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "getNode4insert2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "receiveNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "writeChanges4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "overflow2split", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cst_req", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split2overflow", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "insertFinished3", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ newLeaf2insert_dout sc_in sc_lv 417 signal 0 } 
	{ newLeaf2insert_empty_n sc_in sc_logic 1 signal 0 } 
	{ newLeaf2insert_read sc_out sc_logic 1 signal 0 } 
	{ insertNode4insert_din sc_out sc_lv 417 signal 1 } 
	{ insertNode4insert_full_n sc_in sc_logic 1 signal 1 } 
	{ insertNode4insert_write sc_out sc_logic 1 signal 1 } 
	{ getNode4insert2_din sc_out sc_lv 32 signal 2 } 
	{ getNode4insert2_full_n sc_in sc_logic 1 signal 2 } 
	{ getNode4insert2_write sc_out sc_logic 1 signal 2 } 
	{ receiveNode4insert_dout sc_in sc_lv 417 signal 3 } 
	{ receiveNode4insert_empty_n sc_in sc_logic 1 signal 3 } 
	{ receiveNode4insert_read sc_out sc_logic 1 signal 3 } 
	{ writeChanges4insert_din sc_out sc_lv 417 signal 4 } 
	{ writeChanges4insert_full_n sc_in sc_logic 1 signal 4 } 
	{ writeChanges4insert_write sc_out sc_logic 1 signal 4 } 
	{ overflow2split_din sc_out sc_lv 417 signal 5 } 
	{ overflow2split_full_n sc_in sc_logic 1 signal 5 } 
	{ overflow2split_write sc_out sc_logic 1 signal 5 } 
	{ cst_req_din sc_out sc_lv 417 signal 6 } 
	{ cst_req_full_n sc_in sc_logic 1 signal 6 } 
	{ cst_req_write sc_out sc_logic 1 signal 6 } 
	{ split2overflow_dout sc_in sc_lv 417 signal 7 } 
	{ split2overflow_empty_n sc_in sc_logic 1 signal 7 } 
	{ split2overflow_read sc_out sc_logic 1 signal 7 } 
	{ insertFinished3_din sc_out sc_lv 1 signal 8 } 
	{ insertFinished3_full_n sc_in sc_logic 1 signal 8 } 
	{ insertFinished3_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "newLeaf2insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "dout" }} , 
 	{ "name": "newLeaf2insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "empty_n" }} , 
 	{ "name": "newLeaf2insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "newLeaf2insert", "role": "read" }} , 
 	{ "name": "insertNode4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "din" }} , 
 	{ "name": "insertNode4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "full_n" }} , 
 	{ "name": "insertNode4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "write" }} , 
 	{ "name": "getNode4insert2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "din" }} , 
 	{ "name": "getNode4insert2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "full_n" }} , 
 	{ "name": "getNode4insert2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "write" }} , 
 	{ "name": "receiveNode4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "dout" }} , 
 	{ "name": "receiveNode4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "empty_n" }} , 
 	{ "name": "receiveNode4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "read" }} , 
 	{ "name": "writeChanges4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "din" }} , 
 	{ "name": "writeChanges4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "full_n" }} , 
 	{ "name": "writeChanges4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "write" }} , 
 	{ "name": "overflow2split_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "overflow2split", "role": "din" }} , 
 	{ "name": "overflow2split_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "full_n" }} , 
 	{ "name": "overflow2split_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "write" }} , 
 	{ "name": "cst_req_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "cst_req", "role": "din" }} , 
 	{ "name": "cst_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "full_n" }} , 
 	{ "name": "cst_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "write" }} , 
 	{ "name": "split2overflow_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "split2overflow", "role": "dout" }} , 
 	{ "name": "split2overflow_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "empty_n" }} , 
 	{ "name": "split2overflow_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "read" }} , 
 	{ "name": "insertFinished3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "din" }} , 
 	{ "name": "insertFinished3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "full_n" }} , 
 	{ "name": "insertFinished3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertFinished3", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "insert",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "20",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newLeaf2insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "newLeaf2insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "insertNode4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "insertNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "getNode4insert2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "getNode4insert2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "receiveNode4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "receiveNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "writeChanges4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "writeChanges4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "overflow2split", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "overflow2split_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cst_req", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "cst_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "split2overflow", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "split2overflow_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "insertFinished3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "insertFinished3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "addLeaf", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "received", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_hasLeaves", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wait_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_parent", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_hasLeaves", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_child", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_amount_of_children", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_parent", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_minX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_maxX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_minY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_box_maxY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_amount_of_children", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_minX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_maxX", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_minY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "newLeaf_box_maxY", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "root_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cur_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "26", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state22_blk"}},
			{"Name" : "VITIS_LOOP_334_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "26", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state13", "ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12", "ap_ST_fsm_state15"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cur_child_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.root_child_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	insert {
		newLeaf2insert {Type I LastRead 1 FirstWrite -1}
		insertNode4insert {Type O LastRead -1 FirstWrite 5}
		getNode4insert2 {Type O LastRead -1 FirstWrite 6}
		receiveNode4insert {Type I LastRead 2 FirstWrite -1}
		writeChanges4insert {Type O LastRead -1 FirstWrite 8}
		overflow2split {Type O LastRead -1 FirstWrite 4}
		cst_req {Type O LastRead -1 FirstWrite 4}
		split2overflow {Type I LastRead 2 FirstWrite -1}
		insertFinished3 {Type O LastRead -1 FirstWrite 1}
		state {Type IO LastRead -1 FirstWrite -1}
		addLeaf {Type IO LastRead -1 FirstWrite -1}
		received {Type IO LastRead -1 FirstWrite -1}
		cur_hasLeaves {Type IO LastRead -1 FirstWrite -1}
		wait_r {Type IO LastRead -1 FirstWrite -1}
		newLeaf_index {Type IO LastRead -1 FirstWrite -1}
		newLeaf_parent {Type IO LastRead -1 FirstWrite -1}
		newLeaf_hasLeaves {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_5 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_4 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_3 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_2 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child_1 {Type IO LastRead -1 FirstWrite -1}
		newLeaf_child {Type IO LastRead -1 FirstWrite -1}
		newLeaf_amount_of_children {Type IO LastRead -1 FirstWrite -1}
		cur_index {Type IO LastRead -1 FirstWrite -1}
		cur_parent {Type IO LastRead -1 FirstWrite -1}
		cur_box_minX {Type IO LastRead -1 FirstWrite -1}
		cur_box_maxX {Type IO LastRead -1 FirstWrite -1}
		cur_box_minY {Type IO LastRead -1 FirstWrite -1}
		cur_box_maxY {Type IO LastRead -1 FirstWrite -1}
		cur_amount_of_children {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_minX {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_maxX {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_minY {Type IO LastRead -1 FirstWrite -1}
		newLeaf_box_maxY {Type IO LastRead -1 FirstWrite -1}
		root_index {Type IO LastRead -1 FirstWrite -1}
		cur_child {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	newLeaf2insert { ap_fifo {  { newLeaf2insert_dout fifo_port_we 0 417 }  { newLeaf2insert_empty_n fifo_status 0 1 }  { newLeaf2insert_read fifo_data 1 1 } } }
	insertNode4insert { ap_fifo {  { insertNode4insert_din fifo_port_we 1 417 }  { insertNode4insert_full_n fifo_status 0 1 }  { insertNode4insert_write fifo_data 1 1 } } }
	getNode4insert2 { ap_fifo {  { getNode4insert2_din fifo_port_we 1 32 }  { getNode4insert2_full_n fifo_status 0 1 }  { getNode4insert2_write fifo_data 1 1 } } }
	receiveNode4insert { ap_fifo {  { receiveNode4insert_dout fifo_port_we 0 417 }  { receiveNode4insert_empty_n fifo_status 0 1 }  { receiveNode4insert_read fifo_data 1 1 } } }
	writeChanges4insert { ap_fifo {  { writeChanges4insert_din fifo_port_we 1 417 }  { writeChanges4insert_full_n fifo_status 0 1 }  { writeChanges4insert_write fifo_data 1 1 } } }
	overflow2split { ap_fifo {  { overflow2split_din fifo_port_we 1 417 }  { overflow2split_full_n fifo_status 0 1 }  { overflow2split_write fifo_data 1 1 } } }
	cst_req { ap_fifo {  { cst_req_din fifo_port_we 1 417 }  { cst_req_full_n fifo_status 0 1 }  { cst_req_write fifo_data 1 1 } } }
	split2overflow { ap_fifo {  { split2overflow_dout fifo_port_we 0 417 }  { split2overflow_empty_n fifo_status 0 1 }  { split2overflow_read fifo_data 1 1 } } }
	insertFinished3 { ap_fifo {  { insertFinished3_din fifo_port_we 1 1 }  { insertFinished3_full_n fifo_status 0 1 }  { insertFinished3_write fifo_data 1 1 } } }
}
