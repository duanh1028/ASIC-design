onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_filter/NUM_VAL_BITS
add wave -noupdate /tb_fir_filter/MAX_VAL_BIT
add wave -noupdate /tb_fir_filter/CHECK_DELAY
add wave -noupdate /tb_fir_filter/CLK_PERIOD
add wave -noupdate /tb_fir_filter/COEFF1
add wave -noupdate /tb_fir_filter/COEFF_5
add wave -noupdate /tb_fir_filter/COEFF_25
add wave -noupdate /tb_fir_filter/COEFF_125
add wave -noupdate /tb_fir_filter/COEFF0
add wave -noupdate /tb_fir_filter/tb_n_reset
add wave -noupdate /tb_fir_filter/tb_one_k_samples
add wave -noupdate /tb_fir_filter/tb_err
add wave -noupdate /tb_fir_filter/tb_test_case_num
add wave -noupdate /tb_fir_filter/tb_test_sample_num
add wave -noupdate /tb_fir_filter/tb_expected_err
add wave -noupdate /tb_fir_filter/tb_expected_one_k_samples
add wave -noupdate /tb_fir_filter/tb_clk
add wave -noupdate /tb_fir_filter/tb_std_test_case
add wave -noupdate -expand -group data /tb_fir_filter/DUT/CONTROL/state
add wave -noupdate -expand -group data /tb_fir_filter/tb_modwait
add wave -noupdate -expand -group data /tb_fir_filter/tb_data_ready
add wave -noupdate -expand -group data /tb_fir_filter/DUT/dr
add wave -noupdate -expand -group data /tb_fir_filter/tb_load_coeff
add wave -noupdate -expand -group data /tb_fir_filter/tb_sample
add wave -noupdate -expand -group data /tb_fir_filter/tb_coeff
add wave -noupdate -expand -group data /tb_fir_filter/tb_fir_out
add wave -noupdate -expand -group data /tb_fir_filter/tb_expected_fir_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {471006 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {414662 ps} {590811 ps}
