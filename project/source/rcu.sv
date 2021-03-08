// $Id: $
// File name:   rcu.sv
// Created:     4/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module rcu
(
	input [3:0] pid,
	input clk, n_rst, d_edge, eop, shift_enable, byte_received,
	input [7:0] rcv_data,
	output reg rcving, w_enable, r_error,
	output logic[3:0] state_output
);
typedef enum logic[3:0] {IDLE, EDGE_DETECTED, FIRST_BYTE_RECEIVED, BYTE_MATCHED, STORE, ERROR_WAIT1, ERROR_WAIT2, ERROR, EOP_CHECK1, EOP_CHECK2, EOP_WAIT, RECEIVE_PID, SET_PID} types;

types state, next_state;
assign state_output = state;

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst)
		state <= IDLE;	
	else
		state <= next_state;
end

always_comb begin // next state logic
	next_state = state;
	if(state == IDLE) begin
		if(d_edge)
			next_state = EDGE_DETECTED;
	end
	else if(state == EDGE_DETECTED) begin
		if(byte_received)
			next_state = FIRST_BYTE_RECEIVED;
	end
	else if(state == FIRST_BYTE_RECEIVED) begin
		if(rcv_data == 8'b10000000)
			next_state = RECEIVE_PID;
		else
			next_state = ERROR;	
	end
	else if(state == RECEIVE_PID) begin
		if(byte_received)
			if(rcv_data[3:0] == 4'b0001 | rcv_data[3:0] == 4'b1001 |
			   rcv_data[3:0] == 4'b0011 | rcv_data[3:0] == 4'b1011 | 
		 	   rcv_data[3:0] == 4'b0010 | rcv_data[3:0] == 4'b1010 | 
		 	   rcv_data[3:0] == 4'b1110)
				next_state = SET_PID;
			else
				next_state = ERROR;
	end
	else if(state == SET_PID) begin
		next_state = BYTE_MATCHED;
	end
	else if(state == ERROR) begin
		if(eop && shift_enable)
			next_state = ERROR_WAIT1;
	end
	else if(state == ERROR_WAIT1) begin
		if(d_edge)
			next_state = ERROR_WAIT2;
	end
	else if(state == ERROR_WAIT2) begin
		if(d_edge)
			next_state = EDGE_DETECTED;
	end
	else if(state == BYTE_MATCHED) begin
		if(eop && shift_enable)
			next_state = ERROR_WAIT1;
		else if(byte_received)
			next_state = STORE;
	end
	else if(state == STORE) begin
		next_state = EOP_WAIT;
	end
	else if(state == EOP_WAIT) begin
		if(eop && shift_enable)
			next_state = EOP_CHECK1;
		else if(!eop && shift_enable)
			next_state = BYTE_MATCHED;
	end
	else if(state == EOP_CHECK1) begin
		if(eop && shift_enable)
			next_state = EOP_CHECK2;
		else if(d_edge)
			next_state = ERROR_WAIT2;
	end
	else if(state == EOP_CHECK2) begin 
		if(d_edge)
			next_state = IDLE;
	end
end	

always_comb begin // output logic
	case(state)
		IDLE:	            begin w_enable = 0; r_error = 0; rcving = 0;end
		EDGE_DETECTED:      begin w_enable = 0; r_error = 0; rcving = 1;end
		FIRST_BYTE_RECEIVED:begin w_enable = 0; r_error = 0; rcving = 1;end
		RECEIVE_PID:	    begin w_enable = 0; r_error = 0; rcving = 1;end
		SET_PID:	    begin w_enable = 0; r_error = 0; rcving = 1;end
		ERROR:  	    begin w_enable = 0; r_error = 1; rcving = 1;end
		ERROR_WAIT1:	    begin w_enable = 0; r_error = 1; rcving = 1;end
		ERROR_WAIT2:        begin w_enable = 0; r_error = 1; rcving = 0;end
		BYTE_MATCHED:	    begin w_enable = 0; r_error = 0; rcving = 1;end
		STORE:  	    begin w_enable = 1; r_error = 0; rcving = 1;end
		EOP_CHECK1:	    begin w_enable = 0; r_error = 0; rcving = 1;end
		EOP_CHECK2:   	    begin w_enable = 0; r_error = 0; rcving = 1;end
		EOP_WAIT: 	    begin w_enable = 0; r_error = 0; rcving = 1;end
		default: 	    begin w_enable = 0; r_error = 0; rcving = 0;end
	endcase		
end
endmodule
