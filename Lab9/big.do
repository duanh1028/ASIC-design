onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -expand /tb_ahb_lite_fir_filter/DUT/SLAVE/ahb_reg
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/SLAVE/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/SLAVE/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/CONTROL/state
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/LOADER/state
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/LOADER/load_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/err
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/FIR_FILTER/fir_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {794167 ps} 0}
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
WaveRestoreZoom {108542 ps} {201779 ps}
