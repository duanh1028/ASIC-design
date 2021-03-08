// File name:   adder_16.sv
// Created:     1/19/2015
// Author:      Tim Pritchett
// Version:     1.0  Initial Design Entry
// Description: 16 bit adder design wrapper for synthesis optimization seciton of Lab 2

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	adder_nbit #(16) X(.a(a[15:0]), .b(b[15:0]), .carry_in(carry_in), .sum(sum[15:0]), .overflow(overflow));
	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
endmodule
