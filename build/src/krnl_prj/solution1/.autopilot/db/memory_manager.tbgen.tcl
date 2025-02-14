set moduleName memory_manager
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
set C_modelName {memory_manager}
set C_modelType { void 0 }
set C_modelArgList {
	{ insertNode4insert int 417 regular {fifo 0 volatile }  }
	{ getNode4insert2 int 32 regular {fifo 0 volatile }  }
	{ receiveNode4insert int 417 regular {fifo 1 volatile }  }
	{ writeChanges4insert int 417 regular {fifo 0 volatile }  }
	{ overflow2split int 417 regular {fifo 0 volatile }  }
	{ cst_req int 417 regular {fifo 0 volatile }  }
	{ split2overflow int 417 regular {fifo 1 volatile }  }
	{ gmem int 512 regular {axi_master 2}  }
	{ HBM_PTR int 64 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "insertNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "getNode4insert2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "receiveNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "writeChanges4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "overflow2split", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "cst_req", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "split2overflow", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "HBM_PTR","offset": { "type": "dynamic","port_name": "HBM_PTR","bundle": "control"},"direction": "READWRITE"},{"cName": "operations","offset": { "type": "dynamic","port_name": "operations","bundle": "control"},"direction": "READONLY"},{"cName": "parameters_for_operations","offset": { "type": "dynamic","port_name": "parameters_for_operations","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "HBM_PTR", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ insertNode4insert_dout sc_in sc_lv 417 signal 0 } 
	{ insertNode4insert_empty_n sc_in sc_logic 1 signal 0 } 
	{ insertNode4insert_read sc_out sc_logic 1 signal 0 } 
	{ getNode4insert2_dout sc_in sc_lv 32 signal 1 } 
	{ getNode4insert2_empty_n sc_in sc_logic 1 signal 1 } 
	{ getNode4insert2_read sc_out sc_logic 1 signal 1 } 
	{ receiveNode4insert_din sc_out sc_lv 417 signal 2 } 
	{ receiveNode4insert_full_n sc_in sc_logic 1 signal 2 } 
	{ receiveNode4insert_write sc_out sc_logic 1 signal 2 } 
	{ writeChanges4insert_dout sc_in sc_lv 417 signal 3 } 
	{ writeChanges4insert_empty_n sc_in sc_logic 1 signal 3 } 
	{ writeChanges4insert_read sc_out sc_logic 1 signal 3 } 
	{ overflow2split_dout sc_in sc_lv 417 signal 4 } 
	{ overflow2split_empty_n sc_in sc_logic 1 signal 4 } 
	{ overflow2split_read sc_out sc_logic 1 signal 4 } 
	{ cst_req_dout sc_in sc_lv 417 signal 5 } 
	{ cst_req_empty_n sc_in sc_logic 1 signal 5 } 
	{ cst_req_read sc_out sc_logic 1 signal 5 } 
	{ split2overflow_din sc_out sc_lv 417 signal 6 } 
	{ split2overflow_full_n sc_in sc_logic 1 signal 6 } 
	{ split2overflow_write sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 512 signal 7 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 512 signal 7 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_RFIFONUM sc_in sc_lv 9 signal 7 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 7 } 
	{ HBM_PTR sc_in sc_lv 64 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "insertNode4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "dout" }} , 
 	{ "name": "insertNode4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "empty_n" }} , 
 	{ "name": "insertNode4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "read" }} , 
 	{ "name": "getNode4insert2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "dout" }} , 
 	{ "name": "getNode4insert2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "empty_n" }} , 
 	{ "name": "getNode4insert2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "read" }} , 
 	{ "name": "receiveNode4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "din" }} , 
 	{ "name": "receiveNode4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "full_n" }} , 
 	{ "name": "receiveNode4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "write" }} , 
 	{ "name": "writeChanges4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "dout" }} , 
 	{ "name": "writeChanges4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "empty_n" }} , 
 	{ "name": "writeChanges4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "read" }} , 
 	{ "name": "overflow2split_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "overflow2split", "role": "dout" }} , 
 	{ "name": "overflow2split_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "empty_n" }} , 
 	{ "name": "overflow2split_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "read" }} , 
 	{ "name": "cst_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "cst_req", "role": "dout" }} , 
 	{ "name": "cst_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "empty_n" }} , 
 	{ "name": "cst_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "read" }} , 
 	{ "name": "split2overflow_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "split2overflow", "role": "din" }} , 
 	{ "name": "split2overflow_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "full_n" }} , 
 	{ "name": "split2overflow_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "write" }} , 
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
 	{ "name": "HBM_PTR", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "HBM_PTR", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "13", "15", "17", "19", "21", "23", "25", "32", "34", "36", "38", "40", "42", "44", "45", "46", "47"],
		"CDFG" : "memory_manager",
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
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "insertNode4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "insertNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "getNode4insert2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "getNode4insert2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "receiveNode4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "receiveNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "writeChanges4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "writeChanges4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "overflow2split", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "overflow2split_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cst_req", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cst_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "split2overflow", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "split2overflow_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "983"},
					{"ID" : "32", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "985"},
					{"ID" : "34", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "985"},
					{"ID" : "36", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448", "Port" : "gmem", "Inst_start_state" : "986", "Inst_end_state" : "987"},
					{"ID" : "38", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464", "Port" : "gmem", "Inst_start_state" : "988", "Inst_end_state" : "989"},
					{"ID" : "40", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478", "Port" : "gmem", "Inst_start_state" : "990", "Inst_end_state" : "991"},
					{"ID" : "42", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492", "Port" : "gmem", "Inst_start_state" : "992", "Inst_end_state" : "993"}]},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "H", "Type" : "None", "Direction" : "I"},
			{"Name" : "stack_top", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "array_size", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "array_size", "Inst_start_state" : "373", "Inst_end_state" : "374"}]},
			{"Name" : "OverlapEnlargementArray_index", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Port" : "OverlapEnlargementArray_index", "Inst_start_state" : "537", "Inst_end_state" : "538"}]},
			{"Name" : "OverlapEnlargementArray_overlapEnlargement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Port" : "OverlapEnlargementArray_overlapEnlargement", "Inst_start_state" : "537", "Inst_end_state" : "538"}]},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Port" : "AreaEnlargementArray_index", "Inst_start_state" : "380", "Inst_end_state" : "381"},
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "AreaEnlargementArray_index", "Inst_start_state" : "373", "Inst_end_state" : "374"}]},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Port" : "AreaEnlargementArray_areaEnlargement", "Inst_start_state" : "380", "Inst_end_state" : "381"},
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "AreaEnlargementArray_areaEnlargement", "Inst_start_state" : "373", "Inst_end_state" : "374"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state78"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "VITIS_LOOP_432_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state78", "LastState" : ["ap_ST_fsm_state148"], "QuitState" : ["ap_ST_fsm_state78"], "PreState" : ["ap_ST_fsm_state2", "ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state223", "ap_ST_fsm_state149"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state296", "LastState" : ["ap_ST_fsm_state296"], "QuitState" : ["ap_ST_fsm_state296"], "PreState" : ["ap_ST_fsm_state295"], "PostState" : ["ap_ST_fsm_state297"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state296_blk"}},
			{"Name" : "VITIS_LOOP_479_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state531", "LastState" : ["ap_ST_fsm_state532"], "QuitState" : ["ap_ST_fsm_state532"], "PreState" : ["ap_ST_fsm_state530"], "PostState" : ["ap_ST_fsm_state533"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_588_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state982", "LastState" : ["ap_ST_fsm_state984"], "QuitState" : ["ap_ST_fsm_state982"], "PreState" : ["ap_ST_fsm_state908"], "PostState" : ["ap_ST_fsm_state985"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OverlapEnlargementArray_index_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OverlapEnlargementArray_overlapEnlargement_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AreaEnlargementArray_index_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AreaEnlargementArray_areaEnlargement_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.insert_child_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.curNode_child_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.node_child_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parent_child_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.newNode_child_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rootNode_child_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Parent" : "0", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Parent" : "0", "Child" : ["14"],
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
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_1_fu_1383", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_1_fu_1383.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_12_fu_1388", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "parent_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_12_fu_1388.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_13_fu_1393", "Parent" : "0", "Child" : ["20"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_13_fu_1393.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Parent" : "0", "Child" : ["22"],
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
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_14_fu_1408", "Parent" : "0", "Child" : ["24"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rootNode_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_14_fu_1408.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30", "31"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_598_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "935", "EstimateLatencyMax" : "5493",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln628", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln628_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp215", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln612", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln612_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "margin_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dist_edge_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dist_index_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_598_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5024", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5024"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dadd_64ns_64ns_64_8_full_dsp_1_U29", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U30", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U31", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U32", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.sitodp_32ns_64_5_no_dsp_1_U33", "Parent" : "25"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.mul_32s_32s_32_2_1_U36", "Parent" : "25"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430", "Parent" : "0", "Child" : ["33"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2253", "EstimateLatencyMax" : "2253",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln628", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln628_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_739_19_VITIS_LOOP_741_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "75", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439", "Parent" : "0", "Child" : ["35"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2253", "EstimateLatencyMax" : "2253",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln612", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln612_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_723_17_VITIS_LOOP_725_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "75", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448", "Parent" : "0", "Child" : ["37"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_793_25",
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
			{"Name" : "trunc_ln797_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln797", "Type" : "None", "Direction" : "I"},
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "or_ln797", "Type" : "None", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "child_parent", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "trunc_ln16", "Type" : "None", "Direction" : "I"},
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_793_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "145", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464", "Parent" : "0", "Child" : ["39"],
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
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478", "Parent" : "0", "Child" : ["41"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_825_27",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "88", "EstimateLatencyMax" : "88",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hasValidChild_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_825_27", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492", "Parent" : "0", "Child" : ["43"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_853_28",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "88", "EstimateLatencyMax" : "88",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hasValidChild_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_853_28", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U97", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_64ns_96_5_1_U98", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U99", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_64ns_96_5_1_U100", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager {
		insertNode4insert {Type I LastRead 2 FirstWrite -1}
		getNode4insert2 {Type I LastRead 77 FirstWrite -1}
		receiveNode4insert {Type O LastRead 224 FirstWrite 152}
		writeChanges4insert {Type I LastRead 152 FirstWrite -1}
		overflow2split {Type I LastRead 459 FirstWrite -1}
		cst_req {Type I LastRead 227 FirstWrite -1}
		split2overflow {Type O LastRead -1 FirstWrite 907}
		gmem {Type IO LastRead 2725 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		H {Type I LastRead -1 FirstWrite -1}
		stack_top {Type IO LastRead -1 FirstWrite -1}
		array_size {Type IO LastRead -1 FirstWrite -1}
		OverlapEnlargementArray_index {Type IO LastRead -1 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead -1 FirstWrite -1}
		AreaEnlargementArray_index {Type IO LastRead -1 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead -1 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_505_3 {
		pair_areaEnlargement {Type I LastRead 0 FirstWrite -1}
		curNode_child {Type I LastRead 0 FirstWrite -1}
		array_size {Type IO LastRead 1 FirstWrite 1}
		AreaEnlargementArray_index {Type O LastRead -1 FirstWrite 1}
		AreaEnlargementArray_areaEnlargement {Type O LastRead -1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 {
		mul_ln520 {Type I LastRead 0 FirstWrite -1}
		sext_ln17_1 {Type I LastRead 0 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead 3 FirstWrite 3}
		AreaEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}
	memory_manager_Pipeline_VITIS_LOOP_34_1 {
		node_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_34_12 {
		parent_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_34_13 {
		newNode_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 {
		mul_ln496 {Type I LastRead 0 FirstWrite -1}
		sext_ln17 {Type I LastRead 0 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead 3 FirstWrite 3}
		OverlapEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}
	memory_manager_Pipeline_VITIS_LOOP_34_14 {
		rootNode_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_598_5 {
		node_child {Type IO LastRead 2651 FirstWrite 76}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 2725 FirstWrite -1}
		add_ln628 {Type I LastRead 0 FirstWrite -1}
		add_ln628_1 {Type I LastRead 0 FirstWrite -1}
		cmp215 {Type I LastRead 0 FirstWrite -1}
		add_ln612 {Type I LastRead 0 FirstWrite -1}
		add_ln612_1 {Type I LastRead 0 FirstWrite -1}
		margin_out {Type O LastRead -1 FirstWrite 1}
		dist_edge_out {Type O LastRead -1 FirstWrite 1}
		dist_index_out {Type O LastRead -1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20 {
		node_child {Type IO LastRead 1 FirstWrite 75}
		add_ln628 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		add_ln628_1 {Type I LastRead 0 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18 {
		node_child {Type IO LastRead 1 FirstWrite 75}
		add_ln612 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		add_ln612_1 {Type I LastRead 0 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_793_25 {
		trunc_ln797_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln797 {Type I LastRead 0 FirstWrite -1}
		newNode_child {Type O LastRead -1 FirstWrite 1}
		or_ln797 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 82 FirstWrite 77}
		trunc_ln16 {Type I LastRead 0 FirstWrite -1}
		node_child {Type IO LastRead 1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_809_26 {
		trunc_ln812_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln812 {Type I LastRead 0 FirstWrite -1}
		or_ln812 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 81 FirstWrite 76}
		node_child {Type IO LastRead 0 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_825_27 {
		node_child {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 74}
		p_out1 {Type O LastRead -1 FirstWrite 74}
		p_out2 {Type O LastRead -1 FirstWrite 74}
		p_out3 {Type O LastRead -1 FirstWrite 74}
		hasValidChild_out {Type O LastRead -1 FirstWrite 74}}
	memory_manager_Pipeline_VITIS_LOOP_853_28 {
		newNode_child {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 74}
		p_out1 {Type O LastRead -1 FirstWrite 74}
		p_out2 {Type O LastRead -1 FirstWrite 74}
		p_out3 {Type O LastRead -1 FirstWrite 74}
		hasValidChild_2_out {Type O LastRead -1 FirstWrite 74}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	insertNode4insert { ap_fifo {  { insertNode4insert_dout fifo_port_we 0 417 }  { insertNode4insert_empty_n fifo_status 0 1 }  { insertNode4insert_read fifo_data 1 1 } } }
	getNode4insert2 { ap_fifo {  { getNode4insert2_dout fifo_port_we 0 32 }  { getNode4insert2_empty_n fifo_status 0 1 }  { getNode4insert2_read fifo_data 1 1 } } }
	receiveNode4insert { ap_fifo {  { receiveNode4insert_din fifo_port_we 1 417 }  { receiveNode4insert_full_n fifo_status 0 1 }  { receiveNode4insert_write fifo_data 1 1 } } }
	writeChanges4insert { ap_fifo {  { writeChanges4insert_dout fifo_port_we 0 417 }  { writeChanges4insert_empty_n fifo_status 0 1 }  { writeChanges4insert_read fifo_data 1 1 } } }
	overflow2split { ap_fifo {  { overflow2split_dout fifo_port_we 0 417 }  { overflow2split_empty_n fifo_status 0 1 }  { overflow2split_read fifo_data 1 1 } } }
	cst_req { ap_fifo {  { cst_req_dout fifo_port_we 0 417 }  { cst_req_empty_n fifo_status 0 1 }  { cst_req_read fifo_data 1 1 } } }
	split2overflow { ap_fifo {  { split2overflow_din fifo_port_we 1 417 }  { split2overflow_full_n fifo_status 0 1 }  { split2overflow_write fifo_data 1 1 } } }
	 { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 32 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 512 }  { m_axi_gmem_WSTRB STRB 1 64 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 32 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 512 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RFIFONUM LEN 0 9 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
	HBM_PTR { ap_none {  { HBM_PTR in_data 0 64 } } }
}
set moduleName memory_manager
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
set C_modelName {memory_manager}
set C_modelType { void 0 }
set C_modelArgList {
	{ insertNode4insert int 417 regular {fifo 0 volatile }  }
	{ getNode4insert2 int 32 regular {fifo 0 volatile }  }
	{ receiveNode4insert int 417 regular {fifo 1 volatile }  }
	{ writeChanges4insert int 417 regular {fifo 0 volatile }  }
	{ overflow2split int 417 regular {fifo 0 volatile }  }
	{ cst_req int 417 regular {fifo 0 volatile }  }
	{ split2overflow int 417 regular {fifo 1 volatile }  }
	{ gmem int 512 regular {axi_master 2}  }
	{ HBM_PTR int 64 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "insertNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "getNode4insert2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "receiveNode4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "writeChanges4insert", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "overflow2split", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "cst_req", "interface" : "fifo", "bitwidth" : 417, "direction" : "READONLY"} , 
 	{ "Name" : "split2overflow", "interface" : "fifo", "bitwidth" : 417, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "HBM_PTR","offset": { "type": "dynamic","port_name": "HBM_PTR","bundle": "control"},"direction": "READWRITE"},{"cName": "operations","offset": { "type": "dynamic","port_name": "operations","bundle": "control"},"direction": "READONLY"},{"cName": "parameters_for_operations","offset": { "type": "dynamic","port_name": "parameters_for_operations","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "HBM_PTR", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ insertNode4insert_dout sc_in sc_lv 417 signal 0 } 
	{ insertNode4insert_empty_n sc_in sc_logic 1 signal 0 } 
	{ insertNode4insert_read sc_out sc_logic 1 signal 0 } 
	{ getNode4insert2_dout sc_in sc_lv 32 signal 1 } 
	{ getNode4insert2_empty_n sc_in sc_logic 1 signal 1 } 
	{ getNode4insert2_read sc_out sc_logic 1 signal 1 } 
	{ receiveNode4insert_din sc_out sc_lv 417 signal 2 } 
	{ receiveNode4insert_full_n sc_in sc_logic 1 signal 2 } 
	{ receiveNode4insert_write sc_out sc_logic 1 signal 2 } 
	{ writeChanges4insert_dout sc_in sc_lv 417 signal 3 } 
	{ writeChanges4insert_empty_n sc_in sc_logic 1 signal 3 } 
	{ writeChanges4insert_read sc_out sc_logic 1 signal 3 } 
	{ overflow2split_dout sc_in sc_lv 417 signal 4 } 
	{ overflow2split_empty_n sc_in sc_logic 1 signal 4 } 
	{ overflow2split_read sc_out sc_logic 1 signal 4 } 
	{ cst_req_dout sc_in sc_lv 417 signal 5 } 
	{ cst_req_empty_n sc_in sc_logic 1 signal 5 } 
	{ cst_req_read sc_out sc_logic 1 signal 5 } 
	{ split2overflow_din sc_out sc_lv 417 signal 6 } 
	{ split2overflow_full_n sc_in sc_logic 1 signal 6 } 
	{ split2overflow_write sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 512 signal 7 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 7 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 32 signal 7 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 7 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 7 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 7 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 7 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 512 signal 7 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_RFIFONUM sc_in sc_lv 9 signal 7 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 7 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 7 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 7 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 7 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 7 } 
	{ HBM_PTR sc_in sc_lv 64 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "insertNode4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "dout" }} , 
 	{ "name": "insertNode4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "empty_n" }} , 
 	{ "name": "insertNode4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "insertNode4insert", "role": "read" }} , 
 	{ "name": "getNode4insert2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "dout" }} , 
 	{ "name": "getNode4insert2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "empty_n" }} , 
 	{ "name": "getNode4insert2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "getNode4insert2", "role": "read" }} , 
 	{ "name": "receiveNode4insert_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "din" }} , 
 	{ "name": "receiveNode4insert_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "full_n" }} , 
 	{ "name": "receiveNode4insert_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "receiveNode4insert", "role": "write" }} , 
 	{ "name": "writeChanges4insert_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "dout" }} , 
 	{ "name": "writeChanges4insert_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "empty_n" }} , 
 	{ "name": "writeChanges4insert_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "writeChanges4insert", "role": "read" }} , 
 	{ "name": "overflow2split_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "overflow2split", "role": "dout" }} , 
 	{ "name": "overflow2split_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "empty_n" }} , 
 	{ "name": "overflow2split_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overflow2split", "role": "read" }} , 
 	{ "name": "cst_req_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "cst_req", "role": "dout" }} , 
 	{ "name": "cst_req_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "empty_n" }} , 
 	{ "name": "cst_req_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cst_req", "role": "read" }} , 
 	{ "name": "split2overflow_din", "direction": "out", "datatype": "sc_lv", "bitwidth":417, "type": "signal", "bundle":{"name": "split2overflow", "role": "din" }} , 
 	{ "name": "split2overflow_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "full_n" }} , 
 	{ "name": "split2overflow_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split2overflow", "role": "write" }} , 
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
 	{ "name": "HBM_PTR", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "HBM_PTR", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "13", "15", "17", "19", "21", "23", "25", "32", "34", "36", "38", "40", "42", "44", "45", "46", "47"],
		"CDFG" : "memory_manager",
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
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "insertNode4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "insertNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "getNode4insert2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "getNode4insert2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "receiveNode4insert", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "receiveNode4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "writeChanges4insert", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "writeChanges4insert_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "overflow2split", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "overflow2split_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cst_req", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cst_req_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "split2overflow", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "split2overflow_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "985"},
					{"ID" : "36", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448", "Port" : "gmem", "Inst_start_state" : "986", "Inst_end_state" : "987"},
					{"ID" : "38", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464", "Port" : "gmem", "Inst_start_state" : "988", "Inst_end_state" : "989"},
					{"ID" : "40", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478", "Port" : "gmem", "Inst_start_state" : "990", "Inst_end_state" : "991"},
					{"ID" : "42", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492", "Port" : "gmem", "Inst_start_state" : "992", "Inst_end_state" : "993"},
					{"ID" : "25", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "983"},
					{"ID" : "32", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430", "Port" : "gmem", "Inst_start_state" : "982", "Inst_end_state" : "985"}]},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "H", "Type" : "None", "Direction" : "I"},
			{"Name" : "stack_top", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "array_size", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "array_size", "Inst_start_state" : "373", "Inst_end_state" : "374"}]},
			{"Name" : "OverlapEnlargementArray_index", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Port" : "OverlapEnlargementArray_index", "Inst_start_state" : "537", "Inst_end_state" : "538"}]},
			{"Name" : "OverlapEnlargementArray_overlapEnlargement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Port" : "OverlapEnlargementArray_overlapEnlargement", "Inst_start_state" : "537", "Inst_end_state" : "538"}]},
			{"Name" : "AreaEnlargementArray_index", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Port" : "AreaEnlargementArray_index", "Inst_start_state" : "380", "Inst_end_state" : "381"},
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "AreaEnlargementArray_index", "Inst_start_state" : "373", "Inst_end_state" : "374"}]},
			{"Name" : "AreaEnlargementArray_areaEnlargement", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Port" : "AreaEnlargementArray_areaEnlargement", "Inst_start_state" : "380", "Inst_end_state" : "381"},
					{"ID" : "11", "SubInstance" : "grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Port" : "AreaEnlargementArray_areaEnlargement", "Inst_start_state" : "373", "Inst_end_state" : "374"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state78"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "VITIS_LOOP_432_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state78", "LastState" : ["ap_ST_fsm_state148"], "QuitState" : ["ap_ST_fsm_state78"], "PreState" : ["ap_ST_fsm_state2", "ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state223", "ap_ST_fsm_state149"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state296", "LastState" : ["ap_ST_fsm_state296"], "QuitState" : ["ap_ST_fsm_state296"], "PreState" : ["ap_ST_fsm_state295"], "PostState" : ["ap_ST_fsm_state297"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state296_blk"}},
			{"Name" : "VITIS_LOOP_479_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state531", "LastState" : ["ap_ST_fsm_state532"], "QuitState" : ["ap_ST_fsm_state532"], "PreState" : ["ap_ST_fsm_state530"], "PostState" : ["ap_ST_fsm_state533"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_588_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1209", "FirstState" : "ap_ST_fsm_state982", "LastState" : ["ap_ST_fsm_state984"], "QuitState" : ["ap_ST_fsm_state982"], "PreState" : ["ap_ST_fsm_state908"], "PostState" : ["ap_ST_fsm_state985"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OverlapEnlargementArray_index_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OverlapEnlargementArray_overlapEnlargement_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AreaEnlargementArray_index_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AreaEnlargementArray_areaEnlargement_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.insert_child_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.curNode_child_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.node_child_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parent_child_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.newNode_child_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rootNode_child_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361", "Parent" : "0", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_505_3_fu_1361.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373", "Parent" : "0", "Child" : ["14"],
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
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21_fu_1373.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_1_fu_1383", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_1_fu_1383.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_12_fu_1388", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "parent_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_12_fu_1388.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_13_fu_1393", "Parent" : "0", "Child" : ["20"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_13_fu_1393.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398", "Parent" : "0", "Child" : ["22"],
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
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2_fu_1398.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_14_fu_1408", "Parent" : "0", "Child" : ["24"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_34_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rootNode_child", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_34_14_fu_1408.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413", "Parent" : "0", "Child" : ["26", "27", "28", "29", "30", "31"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_598_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "935", "EstimateLatencyMax" : "5493",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln628", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln628_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp215", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln612", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln612_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "margin_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dist_edge_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dist_index_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_598_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5024", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5024"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dadd_64ns_64ns_64_8_full_dsp_1_U29", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U30", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U31", "Parent" : "25"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.dcmp_64ns_64ns_1_2_no_dsp_1_U32", "Parent" : "25"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.sitodp_32ns_64_5_no_dsp_1_U33", "Parent" : "25"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_598_5_fu_1413.mul_32s_32s_32_2_1_U36", "Parent" : "25"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430", "Parent" : "0", "Child" : ["33"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2253", "EstimateLatencyMax" : "2253",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln628", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln628_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_739_19_VITIS_LOOP_741_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "75", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20_fu_1430.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439", "Parent" : "0", "Child" : ["35"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2253", "EstimateLatencyMax" : "2253",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln612", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add_ln612_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_723_17_VITIS_LOOP_725_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "75", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18_fu_1439.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448", "Parent" : "0", "Child" : ["37"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_793_25",
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
			{"Name" : "trunc_ln797_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln797", "Type" : "None", "Direction" : "I"},
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "or_ln797", "Type" : "None", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "child_parent", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "trunc_ln16", "Type" : "None", "Direction" : "I"},
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_793_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "145", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_793_25_fu_1448.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464", "Parent" : "0", "Child" : ["39"],
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
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_809_26_fu_1464.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478", "Parent" : "0", "Child" : ["41"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_825_27",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "88", "EstimateLatencyMax" : "88",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "node_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hasValidChild_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_825_27", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_825_27_fu_1478.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492", "Parent" : "0", "Child" : ["43"],
		"CDFG" : "memory_manager_Pipeline_VITIS_LOOP_853_28",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "88", "EstimateLatencyMax" : "88",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "newNode_child", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "HBM_PTR", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln12", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hasValidChild_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_853_28", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter38", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter38", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_memory_manager_Pipeline_VITIS_LOOP_853_28_fu_1492.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U97", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_64ns_96_5_1_U98", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U99", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_64ns_96_5_1_U100", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	memory_manager {
		insertNode4insert {Type I LastRead 2 FirstWrite -1}
		getNode4insert2 {Type I LastRead 77 FirstWrite -1}
		receiveNode4insert {Type O LastRead 224 FirstWrite 152}
		writeChanges4insert {Type I LastRead 152 FirstWrite -1}
		overflow2split {Type I LastRead 459 FirstWrite -1}
		cst_req {Type I LastRead 227 FirstWrite -1}
		split2overflow {Type O LastRead -1 FirstWrite 907}
		gmem {Type IO LastRead 2725 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		H {Type I LastRead -1 FirstWrite -1}
		stack_top {Type IO LastRead -1 FirstWrite -1}
		array_size {Type IO LastRead -1 FirstWrite -1}
		OverlapEnlargementArray_index {Type IO LastRead -1 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead -1 FirstWrite -1}
		AreaEnlargementArray_index {Type IO LastRead -1 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead -1 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_505_3 {
		pair_areaEnlargement {Type I LastRead 0 FirstWrite -1}
		curNode_child {Type I LastRead 0 FirstWrite -1}
		array_size {Type IO LastRead 1 FirstWrite 1}
		AreaEnlargementArray_index {Type O LastRead -1 FirstWrite 1}
		AreaEnlargementArray_areaEnlargement {Type O LastRead -1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 {
		mul_ln520 {Type I LastRead 0 FirstWrite -1}
		sext_ln17_1 {Type I LastRead 0 FirstWrite -1}
		AreaEnlargementArray_areaEnlargement {Type IO LastRead 3 FirstWrite 3}
		AreaEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}
	memory_manager_Pipeline_VITIS_LOOP_34_1 {
		node_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_34_12 {
		parent_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_34_13 {
		newNode_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 {
		mul_ln496 {Type I LastRead 0 FirstWrite -1}
		sext_ln17 {Type I LastRead 0 FirstWrite -1}
		OverlapEnlargementArray_overlapEnlargement {Type IO LastRead 3 FirstWrite 3}
		OverlapEnlargementArray_index {Type IO LastRead 4 FirstWrite 4}}
	memory_manager_Pipeline_VITIS_LOOP_34_14 {
		rootNode_child {Type O LastRead -1 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_598_5 {
		node_child {Type IO LastRead 2651 FirstWrite 76}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 2725 FirstWrite -1}
		add_ln628 {Type I LastRead 0 FirstWrite -1}
		add_ln628_1 {Type I LastRead 0 FirstWrite -1}
		cmp215 {Type I LastRead 0 FirstWrite -1}
		add_ln612 {Type I LastRead 0 FirstWrite -1}
		add_ln612_1 {Type I LastRead 0 FirstWrite -1}
		margin_out {Type O LastRead -1 FirstWrite 1}
		dist_edge_out {Type O LastRead -1 FirstWrite 1}
		dist_index_out {Type O LastRead -1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20 {
		node_child {Type IO LastRead 1 FirstWrite 75}
		add_ln628 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		add_ln628_1 {Type I LastRead 0 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18 {
		node_child {Type IO LastRead 1 FirstWrite 75}
		add_ln612 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		add_ln612_1 {Type I LastRead 0 FirstWrite -1}}
	memory_manager_Pipeline_VITIS_LOOP_793_25 {
		trunc_ln797_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln797 {Type I LastRead 0 FirstWrite -1}
		newNode_child {Type O LastRead -1 FirstWrite 1}
		or_ln797 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 82 FirstWrite 77}
		trunc_ln16 {Type I LastRead 0 FirstWrite -1}
		node_child {Type IO LastRead 1 FirstWrite 1}}
	memory_manager_Pipeline_VITIS_LOOP_809_26 {
		trunc_ln812_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln812 {Type I LastRead 0 FirstWrite -1}
		or_ln812 {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		child_parent_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 81 FirstWrite 76}
		node_child {Type IO LastRead 0 FirstWrite 0}}
	memory_manager_Pipeline_VITIS_LOOP_825_27 {
		node_child {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 74}
		p_out1 {Type O LastRead -1 FirstWrite 74}
		p_out2 {Type O LastRead -1 FirstWrite 74}
		p_out3 {Type O LastRead -1 FirstWrite 74}
		hasValidChild_out {Type O LastRead -1 FirstWrite 74}}
	memory_manager_Pipeline_VITIS_LOOP_853_28 {
		newNode_child {Type I LastRead 0 FirstWrite -1}
		HBM_PTR {Type I LastRead 0 FirstWrite -1}
		trunc_ln12 {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 74 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 74}
		p_out1 {Type O LastRead -1 FirstWrite 74}
		p_out2 {Type O LastRead -1 FirstWrite 74}
		p_out3 {Type O LastRead -1 FirstWrite 74}
		hasValidChild_2_out {Type O LastRead -1 FirstWrite 74}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	insertNode4insert { ap_fifo {  { insertNode4insert_dout fifo_port_we 0 417 }  { insertNode4insert_empty_n fifo_status 0 1 }  { insertNode4insert_read fifo_data 1 1 } } }
	getNode4insert2 { ap_fifo {  { getNode4insert2_dout fifo_port_we 0 32 }  { getNode4insert2_empty_n fifo_status 0 1 }  { getNode4insert2_read fifo_data 1 1 } } }
	receiveNode4insert { ap_fifo {  { receiveNode4insert_din fifo_port_we 1 417 }  { receiveNode4insert_full_n fifo_status 0 1 }  { receiveNode4insert_write fifo_data 1 1 } } }
	writeChanges4insert { ap_fifo {  { writeChanges4insert_dout fifo_port_we 0 417 }  { writeChanges4insert_empty_n fifo_status 0 1 }  { writeChanges4insert_read fifo_data 1 1 } } }
	overflow2split { ap_fifo {  { overflow2split_dout fifo_port_we 0 417 }  { overflow2split_empty_n fifo_status 0 1 }  { overflow2split_read fifo_data 1 1 } } }
	cst_req { ap_fifo {  { cst_req_dout fifo_port_we 0 417 }  { cst_req_empty_n fifo_status 0 1 }  { cst_req_read fifo_data 1 1 } } }
	split2overflow { ap_fifo {  { split2overflow_din fifo_port_we 1 417 }  { split2overflow_full_n fifo_status 0 1 }  { split2overflow_write fifo_data 1 1 } } }
	 { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 32 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 512 }  { m_axi_gmem_WSTRB STRB 1 64 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 32 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 512 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RFIFONUM LEN 0 9 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
	HBM_PTR { ap_none {  { HBM_PTR in_data 0 64 } } }
}
