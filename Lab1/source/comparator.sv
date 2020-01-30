// Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input wire [15:0] a,
	input wire [15:0] b,
	output wire gt,
	output wire lt,
	output wire eq
);

	//wire gte;
	//wire lte;
	reg gt_r, lt_r, eq_r;
	assign gt = gt_r;
	assign lt = lt_r;
	assign eq = eq_r;
	//assign gte = GTE;
        //assign lte = LTE;	

	always @ (a, b) begin
		if(a < b) begin
			gt_r = 1'b0;
			lt_r = 1'b1;
			eq_r = 1'b0;
		end
		else if(a == b) begin
			gt_r = 1'b0;
			lt_r = 1'b0;
			eq_r = 1'b1;
		end
		else begin
			gt_r = 1'b1;
			lt_r = 1'b0;
			eq_r = 1'b0;
		end

/*
		if (!(a > b))
			LTE = 1'b1;
		else
			LTE = 1'B0;
		if (!(b > a))
			GTE = 1'b1;
		else
			GTE = 1'b0;
		if (!(lte == 1'b1)) begin
			GT = 1'b1;
			LT = 1'b0;
			EQ = 1'b0;
		end
		else if (!(gte == 1)) begin
			GT = 1'b0;
			LT = 1'b1;
			EQ = 1'b0;
		end
		else begin
			GT = 1'b0;
			LT = 1'b0;
			EQ = 1'b1;
		end */
	end
endmodule