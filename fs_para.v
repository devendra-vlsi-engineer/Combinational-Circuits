// The design module - Full subtractor(N-bit parametered)
module fs_para(a, b ,bin, diff, bar);
	parameter N = 4;
	input [N-1:0]a, b;
	input bin;
	output [N-1:0]diff;
	output bar;
	assign {bar, diff} = a - b - bin;
endmodule

// The testbench - Full subtractor(N-bit Parametered)
module tb;
    integer seed = 1;
	parameter N = 4;
	reg [N-1:0]a, b;
	reg bin;
	wire [N-1:0]diff;
	wire bar;
	fs_para dut(a, b, bin, diff, bar);

	initial begin
		repeat(10) begin
			{a, b, bin} = $random(seed);
			#1;
			$display("a=%b, b=%b, bin=%b, Diff=%b, Barrow=%b", a, b, bin, diff, bar);
		end
	end
endmodule
