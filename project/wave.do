onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_receiver/tb_test_case
add wave -noupdate /tb_usb_receiver/tb_clk
add wave -noupdate /tb_usb_receiver/tb_n_rst
add wave -noupdate -color Gold /tb_usb_receiver/tb_d_plus
add wave -noupdate -color Gold /tb_usb_receiver/DUT/SYNC_HIGH/sync_out
add wave -noupdate -color Goldenrod /tb_usb_receiver/tb_d_minus
add wave -noupdate -color Goldenrod /tb_usb_receiver/DUT/SYNC_LOW/sync_out
add wave -noupdate /tb_usb_receiver/DUT/RCU/byte_received
add wave -noupdate /tb_usb_receiver/DUT/RCU/state
add wave -noupdate /tb_usb_receiver/tb_PID
add wave -noupdate /tb_usb_receiver/DUT/SHIFT_REGISTER/rcv_data
add wave -noupdate /tb_usb_receiver/DUT/SHIFT_REGISTER/shift_enable
add wave -noupdate /tb_usb_receiver/DUT/SHIFT_REGISTER/d_orig
add wave -noupdate /tb_usb_receiver/DUT/STUFF_BIT/stuff_bit_indicator
add wave -noupdate -radix decimal /tb_usb_receiver/DUT/STUFF_BIT/count_out
add wave -noupdate /tb_usb_receiver/DUT/EDGE_DETECT/d_edge
add wave -noupdate /tb_usb_receiver/DUT/EOP/eop
add wave -noupdate /tb_usb_receiver/tb_rcving
add wave -noupdate -radix decimal /tb_usb_receiver/DUT/TIMER/bit_count_out
add wave -noupdate -radix decimal /tb_usb_receiver/DUT/TIMER/clock_count_out
add wave -noupdate /tb_usb_receiver/tb_test_num
add wave -noupdate /tb_usb_receiver/DUT/r_enable
add wave -noupdate /tb_usb_receiver/DUT/w_enable
add wave -noupdate /tb_usb_receiver/DUT/FIFO/FIFO/UFIFORAM/waddr
add wave -noupdate /tb_usb_receiver/DUT/FIFO/FIFO/UFIFORAM/raddr
add wave -noupdate /tb_usb_receiver/DUT/FIFO/FIFO/UFIFORAM/fiforeg
add wave -noupdate /tb_usb_receiver/tb_r_enable
add wave -noupdate /tb_usb_receiver/tb_r_data
add wave -noupdate /tb_usb_receiver/send_byte/i
add wave -noupdate /tb_usb_receiver/tb_empty
add wave -noupdate /tb_usb_receiver/tb_full
add wave -noupdate /tb_usb_receiver/tb_r_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19939965 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 136
configure wave -valuecolwidth 60
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
WaveRestoreZoom {19439096 ps} {20365249 ps}
