// $Id: $
// File name:   tb_mealy.sv
// Created:     2/12/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 10ps

module tb_mealy();
  // Define parameters
  // Common parameters
  localparam CLK_PERIOD        = 2.5;
  localparam PROPAGATION_DELAY = 0.8; // Allow for 800 ps for FF propagation delay  integer tb_test_num;
  localparam TEST_DATA_SIZE    = 30 ;   
  localparam RESET_OUTPUT_VALUE = 0;

  // Declare Test Case Signals
  string  tb_test_case;
  string  tb_stream_check_tag;
  integer tb_bit_num;
  logic   tb_check;
  integer tb_test_num;

 // Declare the Test Bench Signals for Expected Results
  reg    expected_output_bit;
  reg     [TEST_DATA_SIZE - 1:0] tb_test_data;
  logic   [TEST_DATA_SIZE - 1:0] expected_output;
  // Declare DUT Connection Signals
  logic   tb_clk;
  logic   tb_n_rst;
  logic   tb_i;
  logic   tb_o;
  
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


  // Task to cleanly and consistently check DUT output values
  task check_output;
  input string tb_stream_check_tag;
  input integer test_bit;
  begin
    if(expected_output_bit == tb_o) begin // Check passed
      $info("Correct output %s during %dth bit check", tb_stream_check_tag, test_bit);
    end
    else begin // Check failed
      $error("Incorrect output %s during %dth bit check", tb_stream_check_tag, test_bit);
    end

    // Wait some small amount of time so check pulse timing is visible on waves
    #(0.1);
    tb_check =1'b0;
  end
  endtask


  // Clock generation block
  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end


    mealy DUT (.clk(tb_clk), 
	       .n_rst(tb_n_rst),
	       .i(tb_i), 
	       .o(tb_o));


  // Test bench main process
  initial begin
    // Initialize all of the test inputs
    tb_n_rst            = 1'b1; // Initialize to be inactive
    tb_i                = 0;    // Initialize to be inactive
    tb_test_num         = 0;    // Initialize test case counter
    tb_test_case        = "Test bench initializaton";
    tb_stream_check_tag = "N/A";
    tb_bit_num          = -1;   // Initialize to invalid number
    expected_output     = 30'b000000000000000000000000000000;
    expected_output_bit = 0;
    // Wait some time before starting first test case
    #(0.1);


    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_i = 1'b0;
    
    // Wait for a bit before checking or correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    expected_output = 30'b000000000000000000000000000000;
    check_output("after reset applied", 0);

    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output("after clock cycle while in reset", 0);

    // Release the reset away from a clock edge
    @(negedge tb_clk);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    // Check that internal state was correctly keep after reset release
    #(PROPAGATION_DELAY);
    check_output("after reset was released", 0);

    // ************************************************************************
    // Test Case 2: check moore
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "check moore";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();

    // Define the test data and expected_output
    @(negedge tb_clk);
    tb_test_data      = 30'b000000000000010101101100111010;
    expected_output   = 30'b000000000000100100000000000000;

    for(tb_bit_num = 0; tb_bit_num < TEST_DATA_SIZE; tb_bit_num++) begin	
	//@(negedge tb_clk);
	tb_i = tb_test_data[tb_bit_num];
        expected_output_bit = expected_output[tb_bit_num];
	@(negedge tb_clk);
        check_output("check the bit", tb_bit_num);
    end
  end
endmodule






