// $Id: $
// File name:   magnitude.sv
// Created:     2/28/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module magnitude
(
	input  [16:0] in,
	output [15:0] out
);

assign out[15:0] = in[16] ? ~in[15:0] + 1 : in[15:0];

endmodule
