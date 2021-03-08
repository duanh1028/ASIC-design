// $Id: $
// File name:   usb_receiver.sv
// Created:     4/22/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module usb_receiver
(
	input clk, n_rst, d_plus, d_minus, r_enable,
	output reg[7:0] r_data,
	output reg empty, full, rcving, r_error,
	output logic [3:0] PID
);
logic d_plus_sync, d_minus_sync;
logic d_edge, d_orig, eop;
logic byte_received, shift_enable, w_enable;
logic [7:0] rcv_data;
logic [3:0] next_PID;
logic [3:0] state;
logic stuff_bit_indicator;

always_ff@(posedge clk, negedge n_rst) begin
	if(!n_rst)
		PID = '1;
	else
		PID = next_PID;
end

always_comb begin
	next_PID = PID;	
	if(state == 4'b1100)
		next_PID = rcv_data[3:0];
end


sync_high SYNC_HIGH (		.clk(clk),
				.n_rst(n_rst),
				.async_in(d_plus),
				.sync_out(d_plus_sync)
		    );

sync_low SYNC_LOW (		.clk(clk),
				.n_rst(n_rst),
				.async_in(d_minus),
				.sync_out(d_minus_sync)
		   );

edge_detect EDGE_DETECT (	.clk(clk),
				.n_rst(n_rst),
				.d_plus(d_plus_sync),
				.d_edge(d_edge)
			 );

decode DECODE ( 		.clk(clk),
				.n_rst(n_rst),
				.d_plus(d_plus_sync),
				.shift_enable(shift_enable),
				.eop(eop),
				.d_orig(d_orig)
	       );

eop_detect EOP (		.d_plus(d_plus_sync),
				.d_minus(d_minus_sync),
				.eop(eop)
		);

stuff_bit_detector STUFF_BIT(	.clk(clk),
				.n_rst(n_rst),
				.shift_enable(shift_enable),
				.d_orig(d_orig),
				.stuff_bit_indicator(stuff_bit_indicator)
			     );

timer TIMER (			.clk(clk),
				.n_rst(n_rst),
				.d_edge(d_edge),
				.rcving(rcving),
				.shift_enable(shift_enable),
				.byte_received(byte_received),
				.stuff_bit_indicator(stuff_bit_indicator)
	     );

shift_register #(8, 0) SHIFT_REGISTER (	.stuff_bit_indicator(stuff_bit_indicator),
					.clk(clk),
					.n_rst(n_rst),
					.shift_enable(shift_enable),
					.d_orig(d_orig),
					.rcv_data(rcv_data)
			           );

rcu RCU ( 			.clk(clk),
				.n_rst(n_rst),
				.d_edge(d_edge),
				.eop(eop),
				.shift_enable(shift_enable),
				.rcv_data(rcv_data),
				.byte_received(byte_received),
				.rcving(rcving),
				.w_enable(w_enable),
				.r_error(r_error),
				.state_output(state),
				.pid(PID)
	);

rx_fifo FIFO (			.clk(clk),
				.n_rst(n_rst),
				.r_enable(r_enable),
				.w_enable(w_enable),
				.w_data(rcv_data),
				.r_data(r_data),
				.empty(empty),
				.full(full)
);
			
endmodule











