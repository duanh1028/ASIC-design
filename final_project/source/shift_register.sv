// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/11/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module shift_register
#( parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)
(
	input stuff_bit_indicator,
	input clk, n_rst, shift_enable, d_orig,
	output reg [NUM_BITS - 1 : 0]rcv_data
);

reg [NUM_BITS - 1:0] next_rcv_data;

always_ff @ (posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		rcv_data <= '1;
	end
	else
		rcv_data <= next_rcv_data;	
end

always_comb begin
	next_rcv_data = rcv_data;
	if (shift_enable & !stuff_bit_indicator)
		if(SHIFT_MSB)
			next_rcv_data= {rcv_data[NUM_BITS - 2 : 0], d_orig};
		else 
			next_rcv_data = {d_orig, rcv_data[NUM_BITS - 1 : 1]};
end
endmodule
