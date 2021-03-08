// $Id: $
// File name:   eop_detect.sv
// Created:     4/23/2020
// Author:      Haoming Duan
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module eop_detect
(
	input d_plus, d_minus,
	output logic eop
);
assign eop = (~d_plus) & (~d_minus);
endmodule
