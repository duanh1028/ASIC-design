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
endmodule
