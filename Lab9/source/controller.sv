// $Id: $
// File name:   controller.sv
// Created:     2/28/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module controller
(
	input clk, n_rst, dr, lc, overflow,
	output reg cnt_up, clear, modwait,
	output reg [2:0] op,
	output reg [3:0] src1, src2, dest,
	output reg err
);

typedef enum logic [4:0] {IDLE, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, 
			  MUL1, ADD1, MUL2, SUB1, MUL3, ADD2, MUL4, SUB2, EIDLE,
			  RECEIVE_COEFF1, MODWAIT1, RECEIVE_COEFF2, MODWAIT2, 
			  RECEIVE_COEFF3, MODWAIT3, RECEIVE_COEFF4} stateType;
 
typedef enum logic [2:0] {NOP, COPY, LOAD1, LOAD2, ADD, SUB, MUL} opCode;

stateType state, next_state;
reg next_modwait;

always_ff @(posedge clk, negedge n_rst) begin
	if (!n_rst) begin
		state <= IDLE;
		modwait <= 0;
	end
	else begin
		state <= next_state;
		modwait <= next_modwait;
	end
end

always_comb begin  //next_state logic
	next_state = state;
	case(state)
		IDLE:  next_state = dr ? STORE : lc ? RECEIVE_COEFF1 : IDLE;
		STORE: next_state = dr ? ZERO : EIDLE;
		ZERO:  next_state = SORT1;
		SORT1: next_state = SORT2;
		SORT2: next_state = SORT3;
		SORT3: next_state = SORT4;
		SORT4: next_state = MUL1;
		MUL1:  next_state = overflow ? EIDLE : SUB1;
		SUB1:  next_state = overflow ? EIDLE : MUL2;
		MUL2:  next_state = overflow ? EIDLE : ADD1;
		ADD1:  next_state = overflow ? EIDLE : MUL3;
		MUL3:  next_state = overflow ? EIDLE : SUB2;
		SUB2:  next_state = overflow ? EIDLE : MUL4;
		MUL4:  next_state = overflow ? EIDLE : ADD2;
		ADD2:  next_state = overflow ? EIDLE : IDLE;
		EIDLE: next_state = dr ? STORE : EIDLE;
	
		RECEIVE_COEFF1: next_state = MODWAIT1;
		MODWAIT1: next_state = lc ? RECEIVE_COEFF2 : MODWAIT1;
		RECEIVE_COEFF2: next_state = MODWAIT2;
		MODWAIT2: next_state = lc ? RECEIVE_COEFF3 : MODWAIT2;
		RECEIVE_COEFF3: next_state = MODWAIT3;
		MODWAIT3: next_state = lc ? RECEIVE_COEFF4 : MODWAIT3;
		RECEIVE_COEFF4: next_state = IDLE;
		default: next_state = IDLE;
	endcase
	if(next_state == IDLE | next_state == EIDLE 
	  |next_state == MODWAIT1 | next_state == MODWAIT2 |next_state == MODWAIT3)
		next_modwait = 0;
	else 
		next_modwait = 1;
	
end

always_comb begin //output logic
	cnt_up = 0;
	clear  = 0;
	op     = 0;
	src1   = 0;
	src2   = 0;
	dest   = 0;
	err    = 0;
	if (state == IDLE) begin
	
	end		
	else if (state == STORE) begin
		op = LOAD1;
		dest = 5;
		err = 0;
	end
	else if (state == ZERO) begin
		op = SUB;
		src1 = 0;
		src2 = 0;
		dest = 0;
		cnt_up = 1;
	end
	else if (state == SORT1) begin
		op = COPY;
		src1 = 2;
		dest = 1; //reg[1] = sample4
		cnt_up = 0;
	end
	else if (state == SORT2) begin
		op = COPY;
		src1 = 3;
		dest = 2;//reg[2] = sample3
	end
	else if (state == SORT3) begin
		op = COPY;
		src1 = 4;
		dest = 3;//reg[3] = sample2
	end
	else if (state == SORT4) begin
		op = COPY;
		src1 = 5; 
		dest = 4;  //reg[4] = sample1
	end
	else if (state == MUL1) begin
		op = MUL;
		src1 = 4;  //sample1 * F0  negative small
		src2 = 6;
		dest = 10;
	end
	else if (state == SUB1) begin
		op = SUB;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if (state == MUL2) begin
		op = MUL;
		src1 = 3;   //sample2 * F1 positive large
		src2 = 7;
		dest = 10;
	end
	else if (state == ADD1) begin
		op = ADD;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if (state == MUL3) begin
		op = MUL;
		src1 = 2;  //sample3 * F2  negative large
		src2 = 8;
		dest = 10;
	end
	else if (state == SUB2) begin
		op = SUB;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if (state == MUL4) begin
		op = MUL;
		src1 = 1;  //sample4 * F3  positive small
		src2 = 9;
		dest = 10;
	end
	else if (state == ADD2) begin
		op = ADD;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if (state == EIDLE) begin
		err = 1;
	end
	else if (state == RECEIVE_COEFF1) begin
		op = LOAD2;
		dest = 6;  //reg[6] = F0
		clear = 1;
	end
	else if (state == MODWAIT1) begin
		clear = 0;
	end
	else if (state == RECEIVE_COEFF2) begin
		op = LOAD2;
		dest = 7; //reg[8] = F1
	end
	else if (state == MODWAIT2) begin

	end
	else if (state == RECEIVE_COEFF3) begin
		op = LOAD2; 
		dest = 8;  //reg[8] = F2

	end
	else if (state == MODWAIT3) begin
	
	end
	else if (state == RECEIVE_COEFF4) begin
		op = LOAD2; 
		dest = 9; //reg [9] = F3

	end
end



endmodule


























