// $Id: $
// File name:   apb_uart_rx.sv
// Created:     3/5/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module apb_uart_rx
(
	input clk, n_rst, serial_in, psel, penable, pwrite,
	input [2:0] paddr,
	input [7:0] pwdata,
	output reg [7:0] prdata,
	output reg pslverr
);
reg data_ready, data_read, overrun_error, framing_error;
reg [7:0] rx_data;
reg [3:0] data_size;
reg [13:0] bit_period;

apb_slave SLAVE (	.clk(clk),
			.n_rst(n_rst),
			.data_ready(data_ready),
			.overrun_error(overrun_error),
			.framing_error(framing_error),
			.rx_data(rx_data),
			.data_read(data_read),
			.psel(psel),
			.penable(penable),
			.pwrite(pwrite),
			.paddr(paddr),
			.pwdata(pwdata),
			.prdata(prdata),
			.pslverr(pslverr),
			.data_size(data_size),
			.bit_period(bit_period)
		);
rcv_block UART	(	.clk(clk),
			.n_rst(n_rst),
			.serial_in(serial_in),
			.data_read(data_read),
			.bit_period(bit_period),
			.data_size(data_size),
			.rx_data(rx_data),
			.data_ready(data_ready),
			.overrun_error(overrun_error),
			.framing_error(framing_error)
		);
endmodule
