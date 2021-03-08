// $Id: $
// File name:   sensor_s.sv
// Created:     1/21/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: This file is a structural coding of sensor error detector, which has two ports, input sensors[3:0] and output error

module sensor_s
	(
	input wire [3:0]sensors,
	output wire error
	);
	wire o1, a1;
	OR2X1 O1(.A(sensors[2]), .B(sensors[3]), .Y(o1));
	AND2X1 A1(.A(o1), .B(sensors[1]), .Y(a1));
	OR2X1 O2(.A(sensors[0]), .B(a1), .Y(error));
endmodule
