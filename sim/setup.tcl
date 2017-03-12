# This file sets up the simulation environment.
close_project -quiet
create_project -force proj 
set_property part xc7a50tfgg484-2 [current_project]
set_property target_language Verilog [current_project]
set_property "default_lib" "work" [current_project]
create_fileset -simset simset

read_verilog -sv [glob ../source/lfsr.v]
read_verilog -sv [glob ../source/poly_lfsr.v]
read_verilog -sv [glob ../source/poly_lfsr_tb.v]

current_fileset -simset [ get_filesets simset ]

set_property -name {xsim.elaborate.debug_level} -value {all} -objects [current_fileset -simset]
set_property -name {xsim.simulate.runtime} -value {600ns} -objects [current_fileset -simset]

close_project


