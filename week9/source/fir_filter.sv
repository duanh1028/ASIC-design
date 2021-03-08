// $Id: $
// File name:   fir_filter.sv
// Created:     2/28/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module fir_filter
(
	input clk, n_reset, load_coeff, data_ready, 
	input [15:0] sample_data, fir_coefficient,
	output reg modwait, err,
	output reg [15:0] fir_out
);

reg dr, lc, overflow, cnt_up, clear;
reg [3:0] src1, src2, dest;
reg [2:0] op;
reg [16:0] outreg_data;


controller CONTROL (	.clk(clk),
			.n_rst(n_reset),
			.dr(data_ready),
			.lc(load_coeff),
			.overflow(overflow),
			.cnt_up(cnt_up),
			.clear(clear),
			.modwait(modwait),
			.op(op),
			.src1(src1),
			.src2(src2),
			.dest(dest),
			.err(err)
		    );
			
magnitude MAGNITUDE (	.in(outreg_data),
			.out(fir_out)
		    );

datapath DATAPATH (	.clk(clk),
			.n_reset(n_reset),
			.op(op),
			.src1(src1),
			.src2(src2),
			.dest(dest),
			.ext_data1(sample_data),
			.ext_data2(fir_coefficient),
			.outreg_data(outreg_data),
			.overflow(overflow)
		   );


endmodule

	
