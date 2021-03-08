// $Id: $
// File name:   counter.sv
// Created:     2/28/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module counter
(
	input clk, n_rst, cnt_up, clear,
	output one_k_samples
);

reg [9:0] count_out;

flex_counter #(10) FLEX_COUNTER (	.clk(clk),
					.n_rst(n_rst),
					.clear(clear),
					.count_enable(cnt_up),
					.rollover_val(10'b1111101000),
					.count_out(count_out),
		  			.rollover_flag(one_k_samples)
         	 	         );
endmodule
