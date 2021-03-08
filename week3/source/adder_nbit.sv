// $Id: $
// File name:   adder_nbit.sv
// Created:     1/22/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Using parameters and 4-bit Ripple carry adder to create a parameterized rippled carry adder

module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire [BIT_WIDTH - 1:0] a,
	input wire [BIT_WIDTH - 1:0] b,
	input wire carry_in,
	output wire [BIT_WIDTH - 1:0] sum,
	output wire overflow
);
	wire [BIT_WIDTH:0] carrys;
	genvar i;

	assign carrys[0] = carry_in;
	generate
	for(i = 0; i <= BIT_WIDTH - 1; i = i + 1) begin
		adder_1bit IX(.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));	
	end
	endgenerate
	assign overflow = carrys[BIT_WIDTH];


	always @ (a) begin
		for(int i = 0; i < BIT_WIDTH; i++) begin
			assert((a[i] == 1'b1) || (a[i] == 1'b0))
			$else ("error!! Input a should consist of either 1'b1 or 1'b0");
		end
	end

	always @ (b) begin
		for(int i = 0; i < BIT_WIDTH; i++) begin
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
			$else ("error!! Input b should consist of either 1'b1 or 1'b0");
		end
	end

	always @ (carry_in) begin
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
		$else ("error!! Input carry_in should be either 1'b1 or 1'b0");
	end

	always @ (a, b, carrys) begin 
		for(int i = 0; i < BIT_WIDTH; i++) begin
			#(2) assert(((a[i] + b[i] + carrys[i]) % 2) == sum)
			else $error("Ouput 's' of first 1 bit adder is not correct");
		end
	end

	always @ (overflow) begin
		assert((overflow == 1'b1) || (overflow == 1'b0))
		$else ("error!! Ouput overflow should be either 1'b1 or 1'b0");
	end

endmodule
