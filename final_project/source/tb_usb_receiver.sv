// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     4/23/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 10ps
module tb_usb_receiver();
  // Define parameters
  parameter CLK_PERIOD        = 9.6;
  parameter NORM_DATA_PERIOD  = (8 * CLK_PERIOD);

  localparam OUTPUT_CHECK_DELAY = (CLK_PERIOD - 0.2);
  localparam WORST_FAST_DATA_PERIOD = (NORM_DATA_PERIOD * 0.96);
  localparam WORST_SLOW_DATA_PERIOD = (NORM_DATA_PERIOD * 1.04);
   
  //  DUT inputs
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus;
  reg tb_d_minus;
  reg tb_r_enable;
  logic [3:0] tb_PID;
  //  DUT outputs
  reg[7:0] tb_r_data;
  reg tb_empty;
  reg tb_full;
  reg tb_rcving;
  reg tb_r_error;

  // Test bench debug signals
  // Overall test case number for reference
  integer tb_test_num;
  string  tb_test_case;
  
  // DUT portmap
  usb_receiver DUT
  (	.clk(tb_clk),
	.n_rst(tb_n_rst),
	.d_plus(tb_d_plus),
	.d_minus(tb_d_minus),
	.r_enable(tb_r_enable),
	.r_data(tb_r_data),
	.empty(tb_empty),
	.full(tb_full),
	.rcving(tb_rcving),
	.r_error(tb_r_error),
	.PID(tb_PID)
  );

  // Tasks for regulating the timing of input stimulus to the design
  task send_byte;
    input  [7:0] data;  

    integer i;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    // Send data bits
    for(i = 0; i < 8; i++)
    begin
	tb_d_plus = data[i];
	tb_d_minus = !data[i];
	#NORM_DATA_PERIOD;
    end
  end
  endtask

  task close_packet;
  begin
  	@(negedge tb_clk)
	tb_d_plus = 0;
	tb_d_minus = 0;
        #NORM_DATA_PERIOD;
	#NORM_DATA_PERIOD;

	tb_d_plus = 1;
	tb_d_minus = 0;
	#NORM_DATA_PERIOD;
  end
  endtask


  task reset_dut;
  begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;
    
    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);
    
    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;
    
    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
  end
  endtask

  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end



  initial
  begin 
	// Initialize all test bench signals
	tb_test_num               = -1;
	tb_test_case              = "TB Init";
	// Initilize all inputs to inactive/idle values
	tb_n_rst = 1'b1;
	tb_d_plus = 1'b1;
 	tb_d_minus = 1'b0;
	tb_r_enable = 1'b0;
    
	// Get away from Time = 0
   	#0.1; 
	
	// Test case 0: Basic Power on Reset
    	tb_test_num  = 0;
    	tb_test_case = "Power-on-Reset";
    	// DUT Reset
    	reset_dut;

    	// Test case 1: Normal data rate, Normal packet
   	// Synchronize to falling edge of clock to prevent timing 	shifts from prior test case(s)
   	@(negedge tb_clk);
    	tb_test_num  += 1;
   	tb_test_case = "Normal Data-Rate, Normal Packet";
    	reset_dut;
	send_byte(8'b00101010);
  	send_byte(8'b00000011);
	close_packet;


	// Test case 2: Bad eop test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "Bad Eop test";
	//DUT Reset
	reset_dut;
	send_byte(8'b00101010);
	send_byte(8'b11110010);
	send_byte(8'b00000011);
	send_byte(8'b00010100);
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b0;
	#NORM_DATA_PERIOD;
	tb_d_plus = 1'b1;
	tb_d_minus = 1'b0;

	// Test case 3: Bad SYNC byte test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "Bad sync byte test";
	//DUT Reset
	reset_dut;
	send_byte(8'b00101110);
	send_byte(8'b11110010);
	send_byte(8'b00000011);
	send_byte(8'b00010100);
	close_packet;
	
	//TEST case4: 4 sequence packet test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "4 sequence packet test";
	//DUT reset
	reset_dut;
	send_byte(8'b00101010);
	send_byte(8'b10001011);
	send_byte(8'b00101011);
	close_packet;
	tb_test_case = "4 sequence packet test ( packet 2)";
	send_byte(8'b00101011);
	send_byte(8'b10001011);
	send_byte(8'b00101011);
	close_packet;
	tb_test_case = "4 sequence packet test ( packet 3)";
	send_byte(8'b00101010);
	send_byte(8'b10111011);
	send_byte(8'b00101000);
	close_packet;
	tb_test_case = "4 sequence packet test ( packet 4)";
	send_byte(8'b00101010);
	send_byte(8'b11111011);
	send_byte(8'b00101000);
	close_packet;


	//TEST case5: 5 sequence packet test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "early eop test";
	//DUT reset
	reset_dut;
	send_byte(8'b00101010);
	tb_d_plus = 1'b1;
	#NORM_DATA_PERIOD;
	tb_d_plus = 1'b0;
	#NORM_DATA_PERIOD;
	tb_d_plus = 1'b0;
	close_packet;
	send_byte(8'b00101010);
	send_byte(8'b01101010);
	close_packet;


	//TEST case6: 6 sequence packet test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "correct stuff bit and pid test";
	//DUT reset
	reset_dut;
	send_byte(8'b00101010);  //sync byte
	send_byte(8'b01010100);  //pid  byte
	send_byte(8'b01011010);  //data byte1
	@(negedge tb_clk)
	tb_d_plus = 1'b0;
	tb_d_minus = 1'b1;
	#NORM_DATA_PERIOD;
	send_byte(8'b01100000);
	close_packet;

	//TEST case6: 6 sequence packet test
	@(negedge tb_clk);
	tb_test_num += 1;
	tb_test_case = "incorrect stuff bit and pid test";
	//DUT reset
	reset_dut;
	send_byte(8'b00101010);  //sync byte
	send_byte(8'b00000000);  //pid  byte
	send_byte(8'b01011010);  //data byte1
	close_packet;
  end
	
endmodule
