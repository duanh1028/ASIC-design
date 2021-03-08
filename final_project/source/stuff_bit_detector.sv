// $Id: $
// File name:   stuff_bit_detector.sv
// Created:     4/27/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module stuff_bit_detector
(
	input clk, n_rst,
	input shift_enable,
	input d_orig,
	output reg stuff_bit_indicator
);
reg[3:0] count_out;

flex_counter #(4) COUNTER (	.clk(clk),
				.n_rst(n_rst),
				.clear(!d_orig & shift_enable),
				.count_enable(d_orig & shift_enable),
				.rollover_val(4'b0110),
				.count_out(count_out),
				.rollover_flag(stuff_bit_indicator)
			  );
endmodule
