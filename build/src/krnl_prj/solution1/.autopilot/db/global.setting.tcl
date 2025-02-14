
set TopModule "krnl"
set ClockPeriod 3.333
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 3
set intNbAccess 1
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 1
set ResetVariableFlag 0
set ResetRegisterNum 3
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix krnl_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xcu280:-fsvh2892:-2L-e
set SourceFiles {sc {} c {/home/pyuva001/R-Tree-Testbed/src/hls/krnlInsert.cpp /home/pyuva001/R-Tree-Testbed/src/hls/areaEnlargementPair.cpp /home/pyuva001/R-Tree-Testbed/src/hls/overlapEnlargementPair.cpp /home/pyuva001/R-Tree-Testbed/src/hls/nodeArray.cpp /home/pyuva001/R-Tree-Testbed/src/hls/node.cpp /home/pyuva001/R-Tree-Testbed/src/hls/mem_mngr.cpp /home/pyuva001/R-Tree-Testbed/src/hls/krnl.cpp}}
set SourceFlags {sc {} c {-I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include -I/home/pyuva001/R-Tree-Testbed/src/include}}
set DirectiveFile /home/pyuva001/R-Tree-Testbed/build/src/krnl_prj/solution1/solution1.directive
set TBFiles {verilog /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp bc /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp vhdl /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp sc /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp cas /home/pyuva001/R-Tree-Testbed/src/hls/test_krnl.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 1
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus}}}
set HPFPO 0
