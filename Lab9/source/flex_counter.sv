// $Id: $
// File name:   flex_counter.sv
// Created:     2/4/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .


module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input reg clk,
	input reg n_rst,
	input reg clear,
	input reg count_enable,
	input reg [NUM_CNT_BITS - 1:0] rollover_val,
	output reg [NUM_CNT_BITS - 1:0] count_out,
	output reg rollover_flag
);

reg [NUM_CNT_BITS - 1:0] next_count_out;
reg next_rollover_flag;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == 0) begin
		count_out <= 0;
		rollover_flag <= 0;
	end
	else begin
		count_out <= next_count_out;
		rollover_flag <= next_rollover_flag;
	end
end
always_comb begin
	next_count_out = count_out;
	if(clear)
		next_count_out = 0;
	else if (count_enable) begin
		if(count_out == rollover_val)
			next_count_out = 1;
		else
			next_count_out = count_out + 1;
		end
	else 
		next_count_out = count_out;	


	next_rollover_flag = rollover_flag;
	if (next_count_out == rollover_val)
		next_rollover_flag = 1;
	else
		next_rollover_flag = 0;
	
end
endmodule
