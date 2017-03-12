# This script sets up a Vivado project with all ip references resolved.
close_project -quiet
file delete -force proj.xpr *.os *.jou *.log proj.srcs proj.cache proj.runs
#
create_project -force proj 
set_property part xc7a50tftg256-1 [current_project]
set_property target_language verilog [current_project]
set_property default_lib work [current_project]
load_features ipintegrator
tclapp::install ultrafast -quiet

read_verilog -sv [glob ../source/lfsr.v]
read_verilog -sv [glob ../source/poly_lfsr.v]

read_xdc ../../source/top.xdc

close_project


