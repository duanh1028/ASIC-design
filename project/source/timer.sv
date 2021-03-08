// $Id: $
// File name:   timer.sv
// Created:     4/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module timer
(
	input clk, n_rst, d_edge, rcving, stuff_bit_indicator,
	output reg shift_enable, byte_received
);

reg [3:0] clock_count_out, bit_count_out;
reg rollover_flag;
reg byte_received_temp;
reg next_byte_received;

always_ff@(posedge clk, negedge n_rst) begin
	if(!n_rst)
		byte_received <= 0;
	else
		byte_received <= next_byte_received;
end

always_comb begin
	next_byte_received = byte_received_temp && shift_enable && !stuff_bit_indicator;
end

flex_counter #(4) BIT_CLOCK (	.clk(clk),
				.n_rst(n_rst),
				.clear(d_edge),
				.count_enable(rcving),
				.rollover_val(4'b0111),
				.count_out(clock_count_out),
				.rollover_flag(rollover_flag)
			   );

assign shift_enable = clock_count_out == 3;

flex_counter #(4) BYTE_CLOCK (	.clk(clk),
				.n_rst(n_rst),
				.clear(!rcving),
				.count_enable(shift_enable & !stuff_bit_indicator),
				.rollover_val(4'b0111),
				.count_out(bit_count_out),
				.rollover_flag(byte_received_temp)
			     );

endmodule
