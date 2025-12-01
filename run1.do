#vlib work
#vlog fs_multi_1b.v
#vlog compar.v
#vlog bin_to_gray.v
vlog gray_to_bin.v
vsim tb
add wave -position insertpoint sim:/tb/*
run -all
