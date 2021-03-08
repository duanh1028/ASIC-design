onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_mealy/CLK_PERIOD
add wave -noupdate /tb_mealy/PROPAGATION_DELAY
add wave -noupdate /tb_mealy/TEST_DATA_SIZE
add wave -noupdate /tb_mealy/RESET_OUTPUT_VALUE
add wave -noupdate /tb_mealy/tb_test_case
add wave -noupdate /tb_mealy/tb_stream_check_tag
add wave -noupdate /tb_mealy/tb_bit_num
add wave -noupdate /tb_mealy/tb_check
add wave -noupdate /tb_mealy/tb_test_num
add wave -noupdate /tb_mealy/tb_test_data
add wave -noupdate /tb_mealy/expected_output
add wave -noupdate /tb_mealy/tb_clk
add wave -noupdate /tb_mealy/tb_n_rst
add wave -noupdate /tb_mealy/tb_i
add wave -noupdate /tb_mealy/tb_o
add wave -noupdate /tb_mealy/expected_output_bit
add wave -noupdate /tb_mealy/DUT/state
add wave -noupdate /tb_mealy/DUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {48769 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {37836 ps} {54225 ps}
