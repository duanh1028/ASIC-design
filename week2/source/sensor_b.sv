// $Id: $
// File name:   sensor_b.sv
// Created:     1/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: This module is a behavioral coding of sensor error detector. There are two ports, input sensors[3:0] and output error.

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);

always_comb begin
	error = sensors[0] | sensors[1] & (sensors[2] | sensors[3]);
end
endmodule
