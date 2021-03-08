// $Id: $
// File name:   sr_9bit.sv
// Created:     2/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module sr_9bit
(
	input clk, n_rst, shift_strobe, serial_in,
	output reg [7:0]packet_data, 
	output reg stop_bit
);

flex_stp_sr #(9, 0) SHIFT9 (.clk(clk),
			    .n_rst(n_rst),
			    .shift_enable(shift_strobe),
			    .serial_in(serial_in),
			    .parallel_out({stop_bit, packet_data}));
endmodule
