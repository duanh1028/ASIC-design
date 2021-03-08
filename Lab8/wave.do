onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_slave/CLK_PERIOD
add wave -noupdate /tb_apb_slave/BUS_DELAY
add wave -noupdate /tb_apb_slave/DATA_WIDTH
add wave -noupdate /tb_apb_slave/ADDR_WIDTH
add wave -noupdate /tb_apb_slave/DATA_WIDTH_BITS
add wave -noupdate /tb_apb_slave/DATA_MAX_BIT
add wave -noupdate /tb_apb_slave/ADDR_MAX_BIT
add wave -noupdate /tb_apb_slave/ADDR_DATA_SR
add wave -noupdate /tb_apb_slave/ADDR_ERROR_SR
add wave -noupdate /tb_apb_slave/ADDR_BIT_CR0
add wave -noupdate /tb_apb_slave/ADDR_BIT_CR1
add wave -noupdate /tb_apb_slave/ADDR_DATA_CR
add wave -noupdate /tb_apb_slave/ADDR_RX_DATA
add wave -noupdate /tb_apb_slave/RESET_BIT_PERIOD
add wave -noupdate /tb_apb_slave/RESET_DATA_SIZE
add wave -noupdate /tb_apb_slave/tb_enqueue_transaction
add wave -noupdate /tb_apb_slave/tb_transaction_write
add wave -noupdate /tb_apb_slave/tb_transaction_fake
add wave -noupdate /tb_apb_slave/tb_transaction_addr
add wave -noupdate /tb_apb_slave/tb_transaction_data
add wave -noupdate /tb_apb_slave/tb_transaction_error
add wave -noupdate /tb_apb_slave/tb_enable_transactions
add wave -noupdate /tb_apb_slave/tb_current_transaction_num
add wave -noupdate /tb_apb_slave/tb_model_reset
add wave -noupdate /tb_apb_slave/tb_test_case
add wave -noupdate /tb_apb_slave/tb_test_case_num
add wave -noupdate /tb_apb_slave/tb_test_data
add wave -noupdate /tb_apb_slave/tb_check_tag
add wave -noupdate /tb_apb_slave/tb_test_bit_period
add wave -noupdate /tb_apb_slave/tb_test_prdata
add wave -noupdate /tb_apb_slave/tb_mismatch
add wave -noupdate /tb_apb_slave/tb_check
add wave -noupdate /tb_apb_slave/tb_clk
add wave -noupdate /tb_apb_slave/tb_n_rst
add wave -noupdate /tb_apb_slave/tb_psel
add wave -noupdate /tb_apb_slave/tb_paddr
add wave -noupdate /tb_apb_slave/tb_penable
add wave -noupdate /tb_apb_slave/tb_pwrite
add wave -noupdate /tb_apb_slave/tb_pwdata
add wave -noupdate /tb_apb_slave/tb_prdata
add wave -noupdate /tb_apb_slave/tb_pslverr
add wave -noupdate /tb_apb_slave/DUT/state
add wave -noupdate -expand /tb_apb_slave/DUT/apb_reg
add wave -noupdate /tb_apb_slave/tb_rx_data
add wave -noupdate /tb_apb_slave/tb_data_ready
add wave -noupdate /tb_apb_slave/tb_overrun_error
add wave -noupdate /tb_apb_slave/tb_framing_error
add wave -noupdate /tb_apb_slave/tb_data_read
add wave -noupdate /tb_apb_slave/tb_data_size
add wave -noupdate /tb_apb_slave/tb_bit_period
add wave -noupdate /tb_apb_slave/tb_expected_data_read
add wave -noupdate /tb_apb_slave/tb_expected_data_size
add wave -noupdate /tb_apb_slave/tb_expected_bit_period
add wave -noupdate /tb_apb_slave/tb_expected_prdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {178844 ps} 0}
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
WaveRestoreZoom {82178 ps} {404592 ps}
