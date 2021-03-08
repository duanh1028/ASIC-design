// $Id: $
// File name:   tb_flex_counter.sv
// Created:     2/6/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 10;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME);
  localparam  NUM_CNT_BITS  = 4;  

  localparam  INACTIVE_VALUE = 1'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [NUM_CNT_BITS - 1:0] tb_rollover_val;
  reg [NUM_CNT_BITS - 1:0] tb_count_out;
  reg tb_rollover_flag;
  reg [NUM_CNT_BITS - 1:0]expected_count_out;
  reg expected_rollover_flag;
  reg [3:0] i;
  reg clear_exists;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;


    // Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  task check_rollover_flag;
    input logic  expected_value;
    input string check_tag;
  begin
    if(expected_value == tb_rollover_flag) begin // Check passed
      $info("Correct synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover_flag value: expected: %d, tb_value: %d during %s test case", expected_value, tb_rollover_flag, tb_test_case);
    end
  end
  endtask

  task check_count_out;
    input logic  [NUM_CNT_BITS - 1:0] expected_value;
    input string check_tag;
  begin
    if(expected_value == tb_count_out) begin // Check passed
      $info("Correct synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask


  // Task to cleanly and consistently check for correct values during MetaStability Test Cases
  task check_clear;
    input logic expected_value;
    input string check_tag;
  begin
    // Only need to check that it's not a metastable value since decays are random
    if(tb_count_out == expected_value) begin // Check passed
      $info("Correct clear check %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect clear check %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

   // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), 
		   .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));


    // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive

    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);  

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_rollover_flag( RESET_OUTPUT_VALUE, 
                  "after reset applied");
    check_count_out( 4'b0,
                  "after clock cycle while in reset");

    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD)

    check_rollover_flag( RESET_OUTPUT_VALUE, 
                  "after reset applied");
    check_count_out( 4'b0,
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_rollover_flag( RESET_OUTPUT_VALUE, 
                  "after reset applied");
    check_count_out( 4'b0,
                  "after clock cycle while in reset");


    // ************************************************************************
    // Test Case 2: rollover_value = 3
    // ************************************************************************
    
    tb_test_num = tb_test_num + 1;
    tb_test_case = "rollover_value = 3";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b1;    // dectivate reset
    tb_rollover_val = 4'b0011;
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    expected_count_out = 4'b0;	
    //check if the output is correct
    for(i = 0; i <= 7; i = i + 1) begin
	@(posedge tb_clk);
	if(expected_count_out == 3) begin
		expected_count_out = 1'b1;
		expected_rollover_flag = 1'b0;
	end	
	else begin
		expected_rollover_flag = 1'b0;
		expected_count_out += 1;
	end
	if(expected_count_out == 3)
		expected_rollover_flag = 1'b1;
	@(negedge tb_clk);
	check_rollover_flag(expected_rollover_flag, "rollover_flag when rollover_val = 3");
	check_count_out(expected_count_out, "count_out when rollover_val = 3");
    end

	
    // ************************************************************************
    // Test Case 3: check clear
    // ************************************************************************
    @(posedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "check clear";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b1;    // dectivate reset
    tb_rollover_val = 4'b0011;
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    expected_count_out = 4'b0;	
    expected_rollover_flag = 1'b0;
    //check if the output is correct
    for(i = 0; i <= 7; i = i + 1) begin
	if (tb_clear) begin
		expected_count_out = 1'b0;
		expected_count_out = 1'b0;
		clear_exists = 1'b1;
	end
	else
		clear_exists = 1'b0;
	if(tb_clear == 1)	
		check_clear(1'b0, "check clear when clear = 1");
	if(i == 4)
		tb_clear = 1;
	else 
		tb_clear = 0;
	if(expected_count_out == 3) begin
		expected_count_out = 1'b1;
		expected_rollover_flag = 1'b0;
	end	
	else if(clear_exists == 0 && i != 0)begin
		expected_rollover_flag = 1'b0;
		expected_count_out += 1;
	end

	if(expected_count_out == 3)
		expected_rollover_flag = 1'b1;
	@(negedge tb_clk);
	check_rollover_flag(expected_rollover_flag, "rollover_flag when rollover_val = 3");
	check_count_out(expected_count_out, "count_out when rollover_val = 3");
	@(posedge tb_clk);
    end
    // ************************************************************************
    // Test Case 4: discontinuous test
    // ************************************************************************
    @(posedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "discontinuous";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b1;    // dectivate reset
    tb_rollover_val = 4'b0011;
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    expected_count_out = 4'b0;	
    //check if the output is correct
    for(i = 0; i <= 7; i = i + 1) begin
	if(i == 2)
		@(negedge tb_clk)
		tb_count_enable = 0;
	if(i == 5)
		@(negedge tb_clk)
		tb_count_enable = 1;
	
	if(expected_count_out == 3 && tb_count_enable) begin
		expected_count_out = 1'b1;
		expected_rollover_flag = 1'b0;
	end	
	else if (tb_count_enable) begin
		expected_rollover_flag = 1'b0;
		expected_count_out += 1;
	end
	if(expected_count_out == 3 && tb_count_enable)
		expected_rollover_flag = 1'b1;
	@(negedge tb_clk);
	check_rollover_flag(expected_rollover_flag, "rollover_flag when rollover_val = 3");
	check_count_out(expected_count_out, "count_out when rollover_val = 3");
	@(posedge tb_clk);
    end

  end
endmodule

