// $Id: $
// File name:   rcu.sv
// Created:     2/20/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module rcu
(
	input clk, n_rst, new_packet_detected, packet_done, framing_error,
	output reg sbc_clear, sbc_enable, load_buffer, enable_timer
);

typedef enum logic [2:0] {IDLE, SBC_CLEAR, ENABLE_TIMER, SBC_ENABLE, DISABLE_SBC_ENABLE, LOAD_BUFFER} stateType;
reg [2:0] state, next_state;

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb begin
	next_state = IDLE;
	if (state == IDLE) begin
		if (new_packet_detected)
			next_state = SBC_CLEAR;
		else
			next_state = IDLE;
	end
	else if (state == SBC_CLEAR)
		next_state = ENABLE_TIMER;
	else if (state == ENABLE_TIMER) begin
		if (packet_done)
			next_state = SBC_ENABLE;
		else
			next_state = ENABLE_TIMER;
	end
	else if (state == SBC_ENABLE)
		next_state = DISABLE_SBC_ENABLE;
	else if (state == DISABLE_SBC_ENABLE) begin
		if (framing_error == 1)
			next_state = IDLE;
		else
			next_state = LOAD_BUFFER;
	end
	else if (state == LOAD_BUFFER)
		next_state = IDLE;
end


always_comb begin
	load_buffer  = 0;
	sbc_clear    = 0;
	enable_timer = 0;
	sbc_enable   = 0;
	if (state == IDLE)
		load_buffer = 0;
	else if (state == SBC_CLEAR)
		sbc_clear = 1;
	else if (state == ENABLE_TIMER) begin
		sbc_clear = 0;
		enable_timer = 1;
	end	
	else if (state == SBC_ENABLE) begin
		sbc_enable = 1;
		enable_timer = 0;
	end
	else if (state == DISABLE_SBC_ENABLE)
		sbc_enable = 0;
	else if (state == LOAD_BUFFER)
		load_buffer = 1;
end


endmodule
