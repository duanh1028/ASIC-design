// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/31/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module ahb_lite_fir_filter
(
	input clk, n_rst, hsel,
	input [3:0]haddr,
	input hsize,
	input [1:0]htrans,
	input hwrite,
	input [15:0] hwdata,
	output reg [15:0] hrdata,
	output reg hresp
);
reg [15:0]sample_data;
reg data_ready;
reg new_coefficient_set;
reg [15:0]fir_coefficient;
reg modwait;
reg [15:0]fir_out;
reg err;
reg load_coeff;
reg [1:0]coefficient_num;

	ahb_lite_slave SLAVE(	.clk(clk),
				.n_rst(n_rst),
				.sample_data(sample_data),
				.data_ready(data_ready),
				.new_coefficient_set(new_coefficient_set),
				.coefficient_num(coefficient_num),
				.fir_coefficient(fir_coefficient),
				.modwait(modwait),
				.fir_out(fir_out),
				.err(err),
				.hsel(hsel),
				.haddr(haddr),
				.hsize(hsize),
				.htrans(htrans),
				.hwrite(hwrite),
				.hwdata(hwdata),
				.hrdata(hrdata),
				.hresp(hresp)
			    );

	coefficient_loader LOADER(	.clk(clk),
					.n_reset(n_rst),
					.new_coefficient_set(new_coefficient_set),
					.modwait(modwait),
					.load_coeff(load_coeff),
					.coefficient_num(coefficient_num)
				 );

	fir_filter FIR_FILTER(	.clk(clk),
				.n_reset(n_rst),
				.sample_data(sample_data),
				.data_ready(data_ready),
				.fir_coefficient(fir_coefficient),
				.load_coeff(load_coeff),
				.modwait(modwait),
				.fir_out(fir_out),
				.err(err)
			     );

endmodule
