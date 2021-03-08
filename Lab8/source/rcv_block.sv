// $Id: $
// File name:   rcv_block.sv
// Created:     2/24/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module rcv_block
(
	input clk, n_rst, serial_in, data_read,
	input [13:0] bit_period,
	input [3:0] data_size,
	output reg [7:0] rx_data,
	output reg data_ready,
	output reg overrun_error,
	output reg framing_error
);
	reg new_packet_detected;
	reg sbc_clear;
	reg sbc_enable;
	reg load_buffer;
	reg enable_timer;
	reg [7:0] packet_data, processed_packet_data;
	reg shift_enable;
	reg packet_done;
	reg stop_bit;
        reg start_bit_detected;
	always_comb begin
		processed_packet_data = packet_data;
		if (data_size == 7)
			processed_packet_data = {1'b0, packet_data[7:1]};
		else if (data_size == 5)
			processed_packet_data = {3'b0, packet_data[7:3]};
	end	

	start_bit_det START(
			.clk(clk),
			.n_rst(n_rst),
			.serial_in(serial_in),
                        .start_bit_detected(start_bit_detected),
			.new_package_detected(new_packet_detected)
			);
	rcu R(
			.clk(clk),
			.n_rst(n_rst),
			.new_packet_detected(new_packet_detected),
			.packet_done(packet_done),
			.framing_error(framing_error),
			.sbc_clear(sbc_clear),
			.sbc_enable(sbc_enable),
			.load_buffer(load_buffer),		
			.enable_timer(enable_timer)	
       	     );
	stop_bit_chk STOP(
			.clk(clk),
			.n_rst(n_rst),
			.sbc_clear(sbc_clear),
			.sbc_enable(sbc_enable),
			.stop_bit(stop_bit),
			.framing_error(framing_error)
			);
	timer TIMER(
			.clk(clk),
			.n_rst(n_rst),
			.enable_timer(enable_timer),
			.shift_enable(shift_enable),
			.packet_done(packet_done),
 			.bit_period(bit_period),
			.data_size(data_size)
		   );
	sr_bit SR(
			.clk(clk),
			.n_rst(n_rst),
			.shift_strobe(shift_enable),
			.serial_in(serial_in),
			.packet_data(packet_data),
			.stop_bit(stop_bit)
		  );	
	rx_data_buff RX(
			.clk(clk),
			.n_rst(n_rst),
			.load_buffer(load_buffer),
			.packet_data(processed_packet_data),
			.data_read(data_read),
			.rx_data(rx_data),
			.data_ready(data_ready),
			.overrun_error(overrun_error)
			);
endmodule
