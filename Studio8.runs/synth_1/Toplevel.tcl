# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.cache/wt [current_project]
set_property parent.project_path C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Display_driver.vhd
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/sources_1/new/state_machine.vhd
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/sources_1/new/led_ctrl.vhd
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/LEDdisplay.vhd
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/sources_1/new/clock_divider.vhd
  C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/sources_1/new/Toplevel.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/constrs_1/new/studio8constraints.xdc
set_property used_in_implementation false [get_files C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/Studio8/Studio8.srcs/constrs_1/new/studio8constraints.xdc]


synth_design -top Toplevel -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Toplevel.dcp

catch { report_utilization -file Toplevel_utilization_synth.rpt -pb Toplevel_utilization_synth.pb }
