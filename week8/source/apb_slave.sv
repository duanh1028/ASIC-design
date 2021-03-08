// $Id: $
// File name:   apb_slave.sv
// Created:     3/5/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module apb_slave (
	input clk, n_rst, data_ready, overrun_error, framing_error,
	input [7:0] rx_data,
	output reg data_read,
	input psel, penable, pwrite,
	input [2:0] paddr,
	input [7:0] pwdata,
	output reg [7:0] prdata,
	output reg pslverr,
	output reg [3:0] data_size,
	output reg [13:0] bit_period
);
typedef enum logic [1:0] {IDLE, READ, WRITE, ERROR} controllerState;
controllerState next_state, state;
reg[7:0] apb_reg[7:0], next_apb_reg[7:0];
reg[7:0] next_prdata;
reg next_pslverr;

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		state <= IDLE;
		apb_reg <= '{default:'0};
		pslverr <= 0;
		prdata  <= 8'b0;
	end	
	else begin
		state <= next_state;
		apb_reg <= next_apb_reg;
		pslverr <= next_pslverr;
		prdata  <= next_prdata;
	end
end

always_comb begin //apb register next state logic
	next_apb_reg = apb_reg;
 	data_read = 0;
	if(state == READ & paddr == 3'b110) begin
		next_apb_reg[0] = 0;
                data_read = 1;
        end
        else if(data_ready)
		next_apb_reg[0] = 1;
	if(framing_error)
		next_apb_reg[1] = 1;
	else if(overrun_error)
		next_apb_reg[1] = 2;
	else
		next_apb_reg[1] = 0;
	next_apb_reg[6] = rx_data;
	
	if(next_state == WRITE)
		next_apb_reg[paddr] = pwdata;		
end

always_comb begin  //apb register output logic
	data_size = apb_reg[4];
	bit_period = {apb_reg[3][5:0], apb_reg[2]};
end


always_comb begin  //controller next state logic
	next_prdata = 8'b0;
	next_pslverr = 0;	
	next_state = IDLE;
	if (psel) begin
		if (!pwrite) begin
			next_state = READ;
			next_prdata = apb_reg[paddr];	
		end
		else begin
			if (paddr == 2 | paddr == 3 | paddr == 4)
				next_state = WRITE;
			else begin
				next_state = ERROR;
				next_pslverr = 1;	
			end	
		end
	end	
end

endmodule
