set SynModuleInfo {
  {SRCNAME insert MODELNAME insert RTLNAME krnl_insert
    SUBMODULES {
      {MODELNAME krnl_insert_cur_child_RAM_AUTO_1R1W RTLNAME krnl_insert_cur_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_insert_root_child_RAM_AUTO_1R1W RTLNAME krnl_insert_root_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_505_3 MODELNAME memory_manager_Pipeline_VITIS_LOOP_505_3 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_505_3
    SUBMODULES {
      {MODELNAME krnl_flow_control_loop_pipe_sequential_init RTLNAME krnl_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME krnl_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 MODELNAME memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_21}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 MODELNAME memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_17_1_VITIS_LOOP_19_2}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_34_1 MODELNAME memory_manager_Pipeline_VITIS_LOOP_34_1 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_34_1}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_34_12 MODELNAME memory_manager_Pipeline_VITIS_LOOP_34_12 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_34_12}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_34_13 MODELNAME memory_manager_Pipeline_VITIS_LOOP_34_13 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_34_13}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_34_14 MODELNAME memory_manager_Pipeline_VITIS_LOOP_34_14 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_34_14}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_598_5 MODELNAME memory_manager_Pipeline_VITIS_LOOP_598_5 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_598_5
    SUBMODULES {
      {MODELNAME krnl_dadd_64ns_64ns_64_8_full_dsp_1 RTLNAME krnl_dadd_64ns_64ns_64_8_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME krnl_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME krnl_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME krnl_sitodp_32ns_64_5_no_dsp_1 RTLNAME krnl_sitodp_32ns_64_5_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME krnl_mul_32s_32s_32_2_1 RTLNAME krnl_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20 MODELNAME memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_739_19_VITIS_LOOP_741_20}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18 MODELNAME memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_723_17_VITIS_LOOP_725_18}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_793_25 MODELNAME memory_manager_Pipeline_VITIS_LOOP_793_25 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_793_25}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_809_26 MODELNAME memory_manager_Pipeline_VITIS_LOOP_809_26 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_809_26}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_825_27 MODELNAME memory_manager_Pipeline_VITIS_LOOP_825_27 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_825_27}
  {SRCNAME memory_manager_Pipeline_VITIS_LOOP_853_28 MODELNAME memory_manager_Pipeline_VITIS_LOOP_853_28 RTLNAME krnl_memory_manager_Pipeline_VITIS_LOOP_853_28}
  {SRCNAME memory_manager MODELNAME memory_manager RTLNAME krnl_memory_manager
    SUBMODULES {
      {MODELNAME krnl_mul_32ns_64ns_96_5_1 RTLNAME krnl_mul_32ns_64ns_96_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME krnl_memory_manager_OverlapEnlargementArray_index_RAM_AUTO_1R1W RTLNAME krnl_memory_manager_OverlapEnlargementArray_index_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_memory_manager_insert_child_RAM_AUTO_1R1W RTLNAME krnl_memory_manager_insert_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_memory_manager_curNode_child_RAM_AUTO_1R1W RTLNAME krnl_memory_manager_curNode_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_memory_manager_newNode_child_RAM_AUTO_1R1W RTLNAME krnl_memory_manager_newNode_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_memory_manager_rootNode_child_RAM_AUTO_1R1W RTLNAME krnl_memory_manager_rootNode_child_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME krnl MODELNAME krnl RTLNAME krnl IS_TOP 1
    SUBMODULES {
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME newLeaf2insert_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME insertNode4insert_U}
      {MODELNAME krnl_fifo_w32_d2_S RTLNAME krnl_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME getNode4insert_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME receiveNode4insert_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME writeChanges4insert_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME overflow2split_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME cst_req_U}
      {MODELNAME krnl_fifo_w417_d2_S RTLNAME krnl_fifo_w417_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME split2overflow_U}
      {MODELNAME krnl_fifo_w1_d2_S RTLNAME krnl_fifo_w1_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME insertFinished_U}
      {MODELNAME krnl_gmem_m_axi RTLNAME krnl_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME krnl_control_s_axi RTLNAME krnl_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
