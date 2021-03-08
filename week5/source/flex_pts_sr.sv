// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/11/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: ,


module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input clk, n_rst, shift_enable, load_enable, [NUM_BITS - 1:0]parallel_in,
	output reg serial_out
);

reg [NUM_BITS-1:0] next_parallel, parallel;

always_ff @ (posedge clk, negedge n_rst) begin
	if(!n_rst)
		parallel <= '1;
	else
		parallel <= next_parallel;
end

always_comb begin
	next_parallel = parallel;
	if (load_enable)
		next_parallel = parallel_in;
	else if (shift_enable)
		if (SHIFT_MSB)
			next_parallel = {parallel[NUM_BITS - 2:0], 1'b1};
		else 
			next_parallel = {1'b1, parallel[NUM_BITS - 1:1]};
end

always_comb begin
	if (SHIFT_MSB)
			serial_out = parallel[NUM_BITS - 1];
	else
			serial_out = parallel[0];
end	
endmodule
