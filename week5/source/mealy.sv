// $Id: $
// File name:   mealy.sv
// Created:     2/12/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: ,

module mealy
(
	input wire clk, 
	input wire n_rst, 
	input wire i,
	output reg o
);

typedef enum bit [1:0] {state_1, state_2, state_3, idle} stateType;

stateType next_state, state;

always_ff@(posedge clk, negedge n_rst) 
begin : REG_LOGIC
	if(!n_rst)
		state <= idle;
	else
		state <= next_state;
end

always_comb 
begin : NEXT_LOGIC
	next_state = state;
	case(state)
	idle    : next_state = i ? state_1 : idle;
	state_1 : next_state = i ? state_2 : idle;
	state_2 : next_state = i ? state_2 : state_3; 
	state_3 : next_state = i ? state_1 : idle;
	endcase
end


always_comb 
begin : OUT_LOGIC
		o = (state == state_3) && i ? 1'b1 : 1'b0;
end
endmodule

