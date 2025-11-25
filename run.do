vlib work
vlog list.svh
vsim -novopt -suppress 12110 tb +test_name=EMPTY
add wave -r sim:/tb/pif/*
run -all
