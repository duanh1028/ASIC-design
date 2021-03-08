// $Id: $
// File name:   adder_16bit.sv
// Created:     1/28/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: asd

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	adder_nbit #(16) X(.a(a[15:0]), .b(b[15:0]), .carry_in(carry_in), .sum(sum[15:0]), .overflow(overflow));
	
	always @ (a) begin
		for(int i = 0; i <= 15; i++) begin
			assert((a[i] == 1'b1) || (a[i] == 1'b0))
			$else ("error!! Input a should consist of either 1'b1 or 1'b0");
		end
	end

	always @ (b) begin
		for(int i = 0; i <= 15; i++) begin
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
			$else ("error!! Input b should consist of either 1'b1 or 1'b0");
		end
	end

	always @ (carry_in) begin
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
		$else ("error!! Input carry_in should be either 1'b1 or 1'b0");
	end

// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
endmodule
