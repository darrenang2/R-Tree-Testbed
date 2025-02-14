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
    id 23 \
    name OverlapEnlargementArray_overlapEnlargement \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename OverlapEnlargementArray_overlapEnlargement \
    op interface \
    ports { OverlapEnlargementArray_overlapEnlargement_address0 { O 7 vector } OverlapEnlargementArray_overlapEnlargement_ce0 { O 1 bit } OverlapEnlargementArray_overlapEnlargement_we0 { O 1 bit } OverlapEnlargementArray_overlapEnlargement_d0 { O 32 vector } OverlapEnlargementArray_overlapEnlargement_q0 { I 32 vector } OverlapEnlargementArray_overlapEnlargement_address1 { O 7 vector } OverlapEnlargementArray_overlapEnlargement_ce1 { O 1 bit } OverlapEnlargementArray_overlapEnlargement_we1 { O 1 bit } OverlapEnlargementArray_overlapEnlargement_d1 { O 32 vector } OverlapEnlargementArray_overlapEnlargement_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OverlapEnlargementArray_overlapEnlargement'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name OverlapEnlargementArray_index \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename OverlapEnlargementArray_index \
    op interface \
    ports { OverlapEnlargementArray_index_address0 { O 7 vector } OverlapEnlargementArray_index_ce0 { O 1 bit } OverlapEnlargementArray_index_we0 { O 1 bit } OverlapEnlargementArray_index_d0 { O 32 vector } OverlapEnlargementArray_index_q0 { I 32 vector } OverlapEnlargementArray_index_address1 { O 7 vector } OverlapEnlargementArray_index_ce1 { O 1 bit } OverlapEnlargementArray_index_we1 { O 1 bit } OverlapEnlargementArray_index_d1 { O 32 vector } OverlapEnlargementArray_index_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OverlapEnlargementArray_index'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name mul_ln496 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln496 \
    op interface \
    ports { mul_ln496 { I 96 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name sext_ln17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln17 \
    op interface \
    ports { sext_ln17 { I 32 vector } } \
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


