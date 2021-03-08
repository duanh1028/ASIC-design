// $Id: $
// File name:   sync_high.sv
// Created:     2/4/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

reg in;
always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
		in <= 1;
	else
		in <= async_in;
end



always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
		sync_out <= 1;
	else
		sync_out <= in;
end
endmodule
