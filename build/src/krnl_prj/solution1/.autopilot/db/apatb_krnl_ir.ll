; ModuleID = '/home/pyuva001/R-Tree-Testbed/build/src/krnl_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.Node = type { i32, i32, i1, %struct.boundingBox, [6 x i32], i32 }
%struct.boundingBox = type { i32, i32, i32, i32 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"class.hls::stream<int, 0>" }
%"class.hls::stream<int, 0>" = type { i32 }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }

; Function Attrs: noinline
define void @apatb_krnl_ir(%struct.Node* noalias nonnull %HBM_PTR, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly %operations, %"struct.ap_uint<64>"* noalias nocapture nonnull readonly %parameters_for_operations, i32 %number_of_operations, i32 %board_num, i32 %exe) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 112000)
  %HBM_PTR_copy = bitcast i8* %malloccall to [2000 x %struct.Node]*
  %operations_copy = alloca [10 x i32], align 512
  %parameters_for_operations_copy = alloca [10 x i64], align 512
  %0 = bitcast %struct.Node* %HBM_PTR to [2000 x %struct.Node]*
  %1 = bitcast %"struct.ap_uint<32>"* %operations to [10 x %"struct.ap_uint<32>"]*
  %2 = bitcast %"struct.ap_uint<64>"* %parameters_for_operations to [10 x %"struct.ap_uint<64>"]*
  call fastcc void @copy_in([2000 x %struct.Node]* nonnull %0, [2000 x %struct.Node]* %HBM_PTR_copy, [10 x %"struct.ap_uint<32>"]* nonnull %1, [10 x i32]* nonnull align 512 %operations_copy, [10 x %"struct.ap_uint<64>"]* nonnull %2, [10 x i64]* nonnull align 512 %parameters_for_operations_copy)
  %3 = getelementptr inbounds [2000 x %struct.Node], [2000 x %struct.Node]* %HBM_PTR_copy, i32 0, i32 0
  %4 = getelementptr [10 x i32], [10 x i32]* %operations_copy, i32 0, i32 0
  %5 = getelementptr [10 x i64], [10 x i64]* %parameters_for_operations_copy, i32 0, i32 0
  call void @apatb_krnl_hw(%struct.Node* %3, i32* %4, i64* %5, i32 %number_of_operations, i32 %board_num, i32 %exe)
  call void @copy_back([2000 x %struct.Node]* %0, [2000 x %struct.Node]* %HBM_PTR_copy, [10 x %"struct.ap_uint<32>"]* %1, [10 x i32]* %operations_copy, [10 x %"struct.ap_uint<64>"]* %2, [10 x i64]* %parameters_for_operations_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([2000 x %struct.Node]* noalias readonly "unpacked"="0", [2000 x %struct.Node]* noalias "unpacked"="1", [10 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="2", [10 x i32]* noalias nocapture align 512 "unpacked"="3.0.0.0", [10 x %"struct.ap_uint<64>"]* noalias readonly "unpacked"="4", [10 x i64]* noalias nocapture align 512 "unpacked"="5.0.0.0") unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2000struct.Node([2000 x %struct.Node]* %1, [2000 x %struct.Node]* %0)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<32>.101"([10 x i32]* align 512 %3, [10 x %"struct.ap_uint<32>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<64>"([10 x i64]* align 512 %5, [10 x %"struct.ap_uint<64>"]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a2000struct.Node([2000 x %struct.Node]* noalias, [2000 x %struct.Node]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2000 x %struct.Node]* %0, null
  %3 = icmp eq [2000 x %struct.Node]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx30 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %src.addr.07 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 0
  %dst.addr.08 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 0
  %5 = load i32, i32* %src.addr.07, align 4
  store i32 %5, i32* %dst.addr.08, align 4
  %src.addr.19 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 1
  %dst.addr.110 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 1
  %6 = load i32, i32* %src.addr.19, align 4
  store i32 %6, i32* %dst.addr.110, align 4
  %src.addr.211 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 2
  %dst.addr.212 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 2
  %7 = bitcast i1* %src.addr.211 to i8*
  %8 = load i8, i8* %7
  %9 = trunc i8 %8 to i1
  store i1 %9, i1* %dst.addr.212, align 1
  %src.addr.3.015 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 3, i32 0
  %dst.addr.3.016 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 3, i32 0
  %10 = load i32, i32* %src.addr.3.015, align 4
  store i32 %10, i32* %dst.addr.3.016, align 4
  %src.addr.3.117 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 3, i32 1
  %dst.addr.3.118 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 3, i32 1
  %11 = load i32, i32* %src.addr.3.117, align 4
  store i32 %11, i32* %dst.addr.3.118, align 4
  %src.addr.3.219 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 3, i32 2
  %dst.addr.3.220 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 3, i32 2
  %12 = load i32, i32* %src.addr.3.219, align 4
  store i32 %12, i32* %dst.addr.3.220, align 4
  %src.addr.3.321 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 3, i32 3
  %dst.addr.3.322 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 3, i32 3
  %13 = load i32, i32* %src.addr.3.321, align 4
  store i32 %13, i32* %dst.addr.3.322, align 4
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx329 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr527 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 4, i64 %for.loop.idx329
  %src.addr628 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 4, i64 %for.loop.idx329
  %14 = load i32, i32* %src.addr628, align 4
  store i32 %14, i32* %dst.addr527, align 4
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx329, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 6
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %src.addr.525 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %1, i64 0, i64 %for.loop.idx30, i32 5
  %dst.addr.526 = getelementptr [2000 x %struct.Node], [2000 x %struct.Node]* %0, i64 0, i64 %for.loop.idx30, i32 5
  %15 = load i32, i32* %src.addr.525, align 4
  store i32 %15, i32* %dst.addr.526, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx30, 1
  %exitcond31 = icmp ne i64 %for.loop.idx.next, 2000
  br i1 %exitcond31, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([2000 x %struct.Node]* noalias "unpacked"="0", [2000 x %struct.Node]* noalias readonly "unpacked"="1", [10 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [10 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [10 x %"struct.ap_uint<64>"]* noalias "unpacked"="4", [10 x i64]* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2000struct.Node([2000 x %struct.Node]* %0, [2000 x %struct.Node]* %1)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<32>"([10 x %"struct.ap_uint<32>"]* %2, [10 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<64>.77"([10 x %"struct.ap_uint<64>"]* %4, [10 x i64]* align 512 %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<64>.77"([10 x %"struct.ap_uint<64>"]* noalias "unpacked"="0", [10 x i64]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [10 x %"struct.ap_uint<64>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x i64], [10 x i64]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [10 x %"struct.ap_uint<64>"], [10 x %"struct.ap_uint<64>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = load i64, i64* %src.addr.0.0.05, align 8
  store i64 %3, i64* %dst.addr.0.0.06, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 10
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<64>"([10 x i64]* noalias nocapture align 512 "unpacked"="0.0.0.0", [10 x %"struct.ap_uint<64>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [10 x %"struct.ap_uint<64>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x %"struct.ap_uint<64>"], [10 x %"struct.ap_uint<64>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [10 x i64], [10 x i64]* %0, i64 0, i64 %for.loop.idx1
  %3 = load i64, i64* %src.addr.0.0.05, align 8
  store i64 %3, i64* %dst.addr.0.0.06, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 10
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<32>.101"([10 x i32]* noalias nocapture align 512 "unpacked"="0.0.0.0", [10 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [10 x %"struct.ap_uint<32>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x %"struct.ap_uint<32>"], [10 x %"struct.ap_uint<32>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [10 x i32], [10 x i32]* %0, i64 0, i64 %for.loop.idx1
  %3 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %3, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 10
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<32>"([10 x %"struct.ap_uint<32>"]* noalias "unpacked"="0", [10 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [10 x %"struct.ap_uint<32>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x i32], [10 x i32]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [10 x %"struct.ap_uint<32>"], [10 x %"struct.ap_uint<32>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %3, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 10
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @apatb_krnl_hw(%struct.Node*, i32*, i64*, i32, i32, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([2000 x %struct.Node]* noalias "unpacked"="0", [2000 x %struct.Node]* noalias readonly "unpacked"="1", [10 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [10 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [10 x %"struct.ap_uint<64>"]* noalias "unpacked"="4", [10 x i64]* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2000struct.Node([2000 x %struct.Node]* %0, [2000 x %struct.Node]* %1)
  ret void
}

define void @krnl_hw_stub_wrapper(%struct.Node*, i32*, i64*, i32, i32, i32) #4 {
entry:
  %6 = alloca [10 x %"struct.ap_uint<32>"]
  %7 = alloca [10 x %"struct.ap_uint<64>"]
  %8 = bitcast %struct.Node* %0 to [2000 x %struct.Node]*
  %9 = bitcast i32* %1 to [10 x i32]*
  %10 = bitcast i64* %2 to [10 x i64]*
  call void @copy_out([2000 x %struct.Node]* null, [2000 x %struct.Node]* %8, [10 x %"struct.ap_uint<32>"]* %6, [10 x i32]* %9, [10 x %"struct.ap_uint<64>"]* %7, [10 x i64]* %10)
  %11 = bitcast [2000 x %struct.Node]* %8 to %struct.Node*
  %12 = bitcast [10 x %"struct.ap_uint<32>"]* %6 to %"struct.ap_uint<32>"*
  %13 = bitcast [10 x %"struct.ap_uint<64>"]* %7 to %"struct.ap_uint<64>"*
  call void @krnl_hw_stub(%struct.Node* %11, %"struct.ap_uint<32>"* %12, %"struct.ap_uint<64>"* %13, i32 %3, i32 %4, i32 %5)
  call void @copy_in([2000 x %struct.Node]* null, [2000 x %struct.Node]* %8, [10 x %"struct.ap_uint<32>"]* %6, [10 x i32]* %9, [10 x %"struct.ap_uint<64>"]* %7, [10 x i64]* %10)
  ret void
}

declare void @krnl_hw_stub(%struct.Node*, %"struct.ap_uint<32>"*, %"struct.ap_uint<64>"*, i32, i32, i32)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
