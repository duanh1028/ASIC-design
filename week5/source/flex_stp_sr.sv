// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/11/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module flex_stp_sr 
#( parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)
(
	input clk, n_rst, shift_enable, serial_in,
	output reg [NUM_BITS - 1 : 0]parallel_out
);

reg [NUM_BITS - 1:0] next_parallel_out;

always_ff @ (posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		parallel_out <= '1;
	end
	else
		parallel_out <= next_parallel_out;	
end

always_comb begin
	next_parallel_out = parallel_out;
	if (shift_enable)
		if(SHIFT_MSB)
			next_parallel_out = {parallel_out[NUM_BITS - 2 : 0], serial_in};
		else 
			next_parallel_out = {serial_in, parallel_out[NUM_BITS - 1 : 1]};
end
endmodule
