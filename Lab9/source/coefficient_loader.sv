// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/31/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module coefficient_loader
(
	input clk, n_reset, new_coefficient_set, modwait,
	output reg load_coeff,
	output reg [1:0] coefficient_num
);

typedef enum {IDLE, COEFF0, COEFF1, COEFF2, COEFF3} controllerState;
controllerState state, next_state;

always_ff@(posedge clk, negedge n_reset) begin
	if(!n_reset)
		state <= IDLE;
	else
		state <= next_state;
end
always_comb begin
	next_state = state;
	load_coeff = 0;
	coefficient_num = 0;
	if(new_coefficient_set) begin
		if(!modwait) begin
			load_coeff = 1;
			case(state)
				IDLE: begin next_state = COEFF0; coefficient_num = 0; end
				COEFF0: begin next_state = COEFF1; coefficient_num = 1; end
				COEFF1: begin next_state = COEFF2; coefficient_num = 2; end
				COEFF2: begin next_state = COEFF3; coefficient_num = 3; end
				COEFF3: begin next_state = IDLE; coefficient_num = 0; end
				default: coefficient_num = 0;
			endcase
		end
		else begin
			case(state)
				IDLE: coefficient_num = 0;
				COEFF0: coefficient_num = 0;
				COEFF1: coefficient_num = 1;
				COEFF2: coefficient_num = 2;
				COEFF3: coefficient_num = 3;
				default: coefficient_num = 0; 
			endcase
		end
	end
end

endmodule
