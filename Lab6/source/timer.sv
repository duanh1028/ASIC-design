// $Id: $
// File name:   timer.sv
// Created:     2/20/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module timer
(
	input clk, n_rst, enable_timer,
	output reg shift_enable, packet_done
);

reg [3:0] clock_count_out;
reg [3:0] bit_count_out;

flex_counter #(4) CLOCK (.clk(clk),
		    	 .n_rst(n_rst),
		    	 .clear(!enable_timer),
	            	 .count_enable(enable_timer),
		    	 .rollover_val(4'b1010),
		    	 .count_out(clock_count_out),
		    	 .rollover_flag(shift_enable));

flex_counter #(4) BIT   (.clk(clk),
			 .n_rst(n_rst),
			 .clear(!enable_timer),
			 .count_enable(shift_enable),
			 .rollover_val(4'b1001), 
			 .count_out(bit_count_out),
			 .rollover_flag(packet_done));
endmodule
