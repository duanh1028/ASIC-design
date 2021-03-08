// $Id: $
// File name:   edge_detect.sv
// Created:     4/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module edge_detect
(
	input clk, n_rst, d_plus,
	output reg d_edge
);
reg last_d_plus;

always_ff@(posedge clk, negedge n_rst) begin
	if(!n_rst)
		last_d_plus <= 1;
	else
		last_d_plus <= d_plus;
end

always_comb begin
	if(last_d_plus != d_plus)
		d_edge = 1;
	else
		d_edge = 0; 
end
endmodule
