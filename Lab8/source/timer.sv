// $Id: $
// File name:   timer.sv
// Created:     2/20/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module timer
(
	input [3:0] data_size,
	input [13:0] bit_period,
	input clk, n_rst, enable_timer,
	output reg shift_enable, packet_done
);

reg [13:0] clock_count_out;
reg [3:0] bit_count_out;
reg [3:0] data_size_default;
reg [13:0] bit_period_default;
always_comb begin
	data_size_default = data_size == 0 ? 4'b1000 : data_size;
	bit_period_default = bit_period == 0 ? 4'b1010 : bit_period;
end
flex_counter #(14) CLOCK (.clk(clk),
		    	 .n_rst(n_rst),
		    	 .clear(!enable_timer),
	            	 .count_enable(enable_timer),
		    	 .rollover_val(bit_period_default),
		    	 .count_out(clock_count_out),
		    	 .rollover_flag(shift_enable));

flex_counter #(4) BIT   (.clk(clk),
			 .n_rst(n_rst),
			 .clear(!enable_timer),
			 .count_enable(shift_enable),
			 .rollover_val(data_size_default + 1'b1), 
			 .count_out(bit_count_out),
			 .rollover_flag(packet_done));
endmodule
