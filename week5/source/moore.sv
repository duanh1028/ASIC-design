// $Id: $
// File name:   moore.sv
// Created:     2/12/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module moore
(
	input clk, n_rst, i,
	output reg o
);

typedef enum bit [4:0] {state_1, state_2, state_3, state_4, idle} stateType;

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
	if (i)
		case(state)
		idle    : next_state = state_1;
		state_1 : next_state = state_2;
		state_2 : next_state = state_2;
		state_3 : next_state = state_4;
		state_4 : next_state = state_2;
		endcase
	else
		case(state)
		idle    : next_state = idle;
		state_1 : next_state = idle;
		state_2 : next_state = state_3;
		state_3 : next_state = idle;
		state_4 : next_state = idle;	
		endcase
end


always_comb 
begin : OUT_LOGIC
		o = (state == state_4) ? 1'b1 : 1'b0;
end
endmodule


