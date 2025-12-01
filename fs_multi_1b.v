// The design module - Full Subtractor(1bit)
module fs(diff, bar, a, b ,bin);
	input a, b;
	input bin;
	output diff;
	output bar;

	assign {bar, diff} = a - b - bin;

endmodule

//The design module - Full Subtractor(Multi-bit using 1Bit)
module fs_multi_1b(diff, bar, a, b, bin);
	parameter N = 100;
	input [N-1:0]a, b;
	input bin;
	output [N-1:0]diff;
	output bar;
	wire [N:0]w;  // 'N+1' no. of wires
	genvar i;

	generate
		assign w[0] = bin;
		for(i = 0; i < N; i = i+1) begin:dut_number
			fs fs1(diff[i], w[i+1], a[i], b[i], w[i]);
		end
		assign bar = w[N];
	endgenerate

endmodule

//The Test bench - Full Subtractor(Multi-bit using 1Bit)
module tb;
	parameter N = 4;
	reg [N-1:0]a, b;
	reg bin;
	wire [N-1:0]diff;
	wire bar;

	fs_multi_1b #(N)dut(.*);

	initial begin
		repeat(10) begin
			{a, b, bin} = $random;
			#1;
			$display("A = %b, B = %b, Bin = %b, Diff = %b, Barrow = %b", a, b, bin, diff, bar);
		end
	end
endmodule
