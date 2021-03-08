// $Id: $
// File name:   rx_fifo.sv
// Created:     4/22/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: ,

module rx_fifo
(
	input clk, n_rst,
	input w_enable, r_enable,
	input[7:0] w_data,
	output reg[7:0] r_data,
	output reg full, empty
);

fifo FIFO(	.r_clk(clk),
		.w_clk(clk),
		.n_rst(n_rst),
		.r_enable(r_enable),
		.w_enable(w_enable),
		.w_data(w_data),
		.r_data(r_data),
		.empty(empty),
		.full(full)
);
endmodule
