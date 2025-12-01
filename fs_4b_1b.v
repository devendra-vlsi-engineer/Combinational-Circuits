// The design module - Full Subtractor(1bit)
module fs(diff, bar, a, b ,bin);
	input a, b;
	input bin;
	output diff;
	output bar;

	assign {bar, diff} = a - b - bin;

endmodule

//The design module - Full Subtractor(4Bit using 1Bit)
module fs_4b_1b(diff, bar, a, b, bin);
	input [3:0]a, b;
	input bin;
	output [3:0]diff;
	output bar;
	wire b1, b2, b3;

	fs fs1(diff[0], b1, a[0], b[0], bin);	
	fs fs2(diff[1], b2, a[1], b[1], b1);	
	fs fs3(diff[2], b3, a[2], b[2], b2);	
	fs fs4(diff[3], bar, a[3], b[3], b3);	
	
endmodule

//The Test bench - Full Subtractor(4Bit using 1Bit)
module tb;	
	reg [3:0]a, b;
	reg bin;
	wire [3:0]diff;
	wire bar;

	fs_4b_1b dut(.*);

	initial begin
		repeat(10) begin
			{a, b, bin} = $random;
			#1;
			$display("A = %b, B = %b, Bin = %b, Diff = %b, Barrow = %b", a, b, bin, diff, bar);
		end
	end
endmodule
