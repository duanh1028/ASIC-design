// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/30/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module ahb_lite_slave
(
	input clk, n_rst,
	output reg [15:0] sample_data,
	output reg data_ready,
	output reg new_coefficient_set,
	input [1:0] coefficient_num,
	output reg [15:0] fir_coefficient,
	input modwait,
	input [15:0] fir_out,
	input err,
	input hsel,
	input [3:0] haddr,
	input hsize,
	input [1:0] htrans,
	input hwrite,
	input [15:0] hwdata,
	output reg [15:0] hrdata,
	output reg hresp
);
typedef enum logic [2:0] {IDLE, READ, WRITE} controllerState;
controllerState state, next_state;
reg [3:0] copy_haddr;
reg [2:0] copy_hsize;
reg [15:0] next_hrdata;
reg [7:0] ahb_reg[14:0], next_ahb_reg[14:0];
reg next_data_ready;

always_ff@(posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		state <= IDLE;
		ahb_reg <= '{default:'0};
		data_ready <= 1'b0;
		copy_haddr <= 4'b0;
		copy_hsize <= 3'b0;
	end
	else begin
		copy_haddr <= haddr;
		copy_hsize <= hsize;
		state <= next_state;
		ahb_reg <= next_ahb_reg;	
		data_ready <= next_data_ready;
	end
end

always_comb begin
	hrdata = 16'b0;
	next_data_ready = data_ready;
	next_ahb_reg = ahb_reg;
	next_ahb_reg[3]  = fir_out[15:8];
	next_ahb_reg[2]  = fir_out[7:0];
	new_coefficient_set = ahb_reg[14][0];

	if(new_coefficient_set) begin
		next_ahb_reg[1] = 0;
		next_ahb_reg[0] = 1;
	end
	else if (modwait) begin
		next_ahb_reg[1] = 0;
		next_ahb_reg[0] = 1;
	end
	else if (err) begin
		next_ahb_reg[1] = 1;
		next_ahb_reg[0] = 0;
	end
	else begin
		next_ahb_reg[1] = 0;
		next_ahb_reg[0] = 0;
	end

	sample_data[15:8] = ahb_reg[5];
	sample_data[7:0]  = ahb_reg[4];
	
	fir_coefficient[15:8] = ahb_reg[(coefficient_num * 2) + 7];
	fir_coefficient[7:0]  = ahb_reg[(coefficient_num * 2) + 6];
	if(coefficient_num == 3 & modwait)
		next_ahb_reg[14] = 0;
	if(state == WRITE) begin
		if(copy_hsize == 0) begin
			if(copy_haddr % 2)
				next_ahb_reg[copy_haddr] = hwdata[15:8];
			else
				next_ahb_reg[copy_haddr] = hwdata[7:0];
		end
		else if(copy_hsize == 1) begin
			next_ahb_reg[{copy_haddr[3:1], 1'b1}][7:0] = hwdata[15:8];
			next_ahb_reg[{copy_haddr[3:1], 1'b0}][7:0] = hwdata[7:0];
		end
		if(copy_haddr == 4 | copy_haddr == 5)
			next_data_ready = 1;
	end
	if(modwait)
		next_data_ready = 0;

	if(state == READ) begin
		if(copy_hsize == 0) begin
			if(haddr % 2)
				hrdata = {ahb_reg[copy_haddr], 8'b0};
			else
				hrdata  = {8'b0, ahb_reg[copy_haddr]};
			end
		else if(copy_hsize == 1) begin
			hrdata[7:0] = ahb_reg[{copy_haddr[3:1], 1'b0}];
			hrdata[15:8] = ahb_reg[{copy_haddr[3:1], 1'b1}];
		end
	end
end

always_comb begin
	hresp = 0;
	next_state = IDLE;
	if(hsel & htrans != 0) begin
		if(!hwrite) begin
			if(haddr != 15)
				next_state = READ;
			else
				hresp = 1'b1;
		end
		else if((haddr >= 4) & (haddr <= 14))
			next_state = WRITE;
		else
			hresp = 1'b1;
	end
end
endmodule


