# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name AreaEnlargementArray_areaEnlargement \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename AreaEnlargementArray_areaEnlargement \
    op interface \
    ports { AreaEnlargementArray_areaEnlargement_address0 { O 7 vector } AreaEnlargementArray_areaEnlargement_ce0 { O 1 bit } AreaEnlargementArray_areaEnlargement_we0 { O 1 bit } AreaEnlargementArray_areaEnlargement_d0 { O 32 vector } AreaEnlargementArray_areaEnlargement_q0 { I 32 vector } AreaEnlargementArray_areaEnlargement_address1 { O 7 vector } AreaEnlargementArray_areaEnlargement_ce1 { O 1 bit } AreaEnlargementArray_areaEnlargement_we1 { O 1 bit } AreaEnlargementArray_areaEnlargement_d1 { O 32 vector } AreaEnlargementArray_areaEnlargement_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'AreaEnlargementArray_areaEnlargement'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name AreaEnlargementArray_index \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename AreaEnlargementArray_index \
    op interface \
    ports { AreaEnlargementArray_index_address0 { O 7 vector } AreaEnlargementArray_index_ce0 { O 1 bit } AreaEnlargementArray_index_we0 { O 1 bit } AreaEnlargementArray_index_d0 { O 32 vector } AreaEnlargementArray_index_q0 { I 32 vector } AreaEnlargementArray_index_address1 { O 7 vector } AreaEnlargementArray_index_ce1 { O 1 bit } AreaEnlargementArray_index_we1 { O 1 bit } AreaEnlargementArray_index_d1 { O 32 vector } AreaEnlargementArray_index_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'AreaEnlargementArray_index'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name mul_ln520 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln520 \
    op interface \
    ports { mul_ln520 { I 96 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name sext_ln17_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln17_1 \
    op interface \
    ports { sext_ln17_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName krnl_flow_control_loop_pipe_sequential_init_U
set CompName krnl_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix krnl_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


