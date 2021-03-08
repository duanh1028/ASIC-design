onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_adder_16bit/NUM_INPUT_BITS
add wave -noupdate /tb_adder_16bit/MAX_INPUT_BIT
add wave -noupdate /tb_adder_16bit/NUM_OUTPUT_BITS
add wave -noupdate /tb_adder_16bit/MAX_OUTPUT_BIT
add wave -noupdate /tb_adder_16bit/NUM_SUM_BITS
add wave -noupdate /tb_adder_16bit/MAX_SUM_BIT
add wave -noupdate /tb_adder_16bit/OVERFLOW_BIT
add wave -noupdate /tb_adder_16bit/TEST_DELAY
add wave -noupdate -divider {New Divider}
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold /tb_adder_16bit/tb_test_case
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/tb_a
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/DUT/a
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/DUT/b
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group input -radix unsigned /tb_adder_16bit/DUT/carry_in
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case_stage
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_expected_outs
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_expected_overflow
add wave -noupdate -expand -group Results -radix unsigned /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Results -radix unsigned /tb_adder_16bit/DUT/sum
add wave -noupdate -expand -group Results -radix unsigned /tb_adder_16bit/DUT/overflow
add wave -noupdate -expand -group Results -radix unsigned /tb_adder_16bit/tb_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9100 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
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
WaveRestoreZoom {0 ps} {78220 ps}
