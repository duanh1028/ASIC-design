// $Id: $
// File name:   decode.sv
// Created:     4/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module decode
(
	input clk, n_rst, d_plus, shift_enable, eop,
	output reg d_orig
);

reg next_d_orig_temp, last_d_plus, next_d_orig;

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		d_orig      <= 1;
		last_d_plus <= 1;
	end
	else begin
		d_orig      <= next_d_orig;
		last_d_plus <= d_plus;
	end
end

always_comb begin
	next_d_orig_temp = d_plus == last_d_plus ? 1 : 0;
	if(d_orig == 1)
		next_d_orig = next_d_orig_temp;
	else
		next_d_orig = shift_enable ? 1 : d_orig;
end
endmodule
