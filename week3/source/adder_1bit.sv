// $Id: $
// File name:   adder_1bit.sv
// Created:     1/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: This module will implement 1-bit full adder

module adder_1bit
( 
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
	assign sum = carry_in ^ ( a ^ b);
	assign carry_out = ((~carry_in) & b & a) | (carry_in & ( b | a));
	
	always @ (a) begin
		assert((a == 1'b1) || (a == 1'b0))
		$else ("error!! Input a should be either 1'b0 or 1'b1");
	end

	always @ (b) begin
		assert((b == 1'b1) || (b == 1'b0))
		$else ("error!! Input b should be either 1'b0 or 1'b1");
	end
	
	always @ (carry_in) begin
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
		$else ("error!! Input carry_in should be either 1'b0 or 1'b1");
	end
	
endmodule
