set projDir "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/vivado"
set projName "countergame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/au_top_0.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/reset_conditioner_1.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/button_conditioner_2.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/edge_detector_3.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/edge_detector_4.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/register_5.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/alu_6.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/led_matrix_driver_7.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/pn_gen_8.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/bin_to_dec_9.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/pipeline_10.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/boole_11.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/shift_12.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/arithmetic_13.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/compare_14.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/multi_led_display_15.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/counter_16.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/matrix_lut_17.v" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/verilog/decoder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/constraint/debugtools.xdc" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/constraint/sevenseg.xdc" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/constraint/alchitry.xdc" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/constraint/buttons.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/Pootis-PC/Documents/Alchitry/countergame/work/constraint/ledmatrix.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
