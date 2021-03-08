onerror {resume}
quietly virtual function -install /tb_rcv_block -env /tb_rcv_block { &{/tb_rcv_block/tb_rx_data, /tb_rcv_block/tb_test_data }} data
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rcv_block/CLK_PERIOD
add wave -noupdate /tb_rcv_block/NORM_DATA_PERIOD
add wave -noupdate /tb_rcv_block/OUTPUT_CHECK_DELAY
add wave -noupdate /tb_rcv_block/WORST_FAST_DATA_PERIOD
add wave -noupdate /tb_rcv_block/WORST_SLOW_DATA_PERIOD
add wave -noupdate /tb_rcv_block/tb_clk
add wave -noupdate /tb_rcv_block/tb_n_rst
add wave -noupdate /tb_rcv_block/tb_serial_in
add wave -noupdate /tb_rcv_block/tb_test_num
add wave -noupdate /tb_rcv_block/tb_test_case
add wave -noupdate /tb_rcv_block/tb_test_stop_bit
add wave -noupdate /tb_rcv_block/tb_test_bit_period
add wave -noupdate -expand -group data_read /tb_rcv_block/tb_data_read
add wave -noupdate -expand -group data_read /tb_rcv_block/tb_test_data_read
add wave -noupdate -expand -group data /tb_rcv_block/tb_rx_data
add wave -noupdate -expand -group data /tb_rcv_block/tb_test_data
add wave -noupdate -expand -group data /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -group {framing error} /tb_rcv_block/tb_framing_error
add wave -noupdate -group {framing error} /tb_rcv_block/tb_expected_framing_error
add wave -noupdate -expand -group data_ready /tb_rcv_block/tb_data_ready
add wave -noupdate -expand -group data_ready /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -group overrun /tb_rcv_block/tb_overrun_error
add wave -noupdate -group overrun /tb_rcv_block/tb_expected_overrun
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {331208 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
configure wave -valuecolwidth 69
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
WaveRestoreZoom {0 ps} {2100 ns}
