// The design module - Full adder(1bit)
module fa(sum, carry, a, b, cin);
	input a, b, cin;
	output sum, carry;

	assign {carry, sum} = a+b+cin;

endmodule

// The design module - Full adder(Multi-bit using 1bit)
module fa_multi_1b(sum, carry, a, b, cin);
	parameter N = 100;
	input [N-1:0]a, b;
	input cin;
	output [N-1:0] sum;
	output carry;
	wire [N:0]c;
	genvar i;
	
	generate
		assign c[0] = cin;
		for(i = 0; i < N; i = i + 1) begin:make_fa
			fa f1(sum[i], c[i+1], a[i], b[i], c[i]);
		end
	endgenerate

	assign carry = c[N];

endmodule

// The testbench module - Full adder(Multi-bit using 1bit)
module tb;
	parameter N = 16;
	reg [N-1:0]a, b;
	reg cin;
	wire [N-1:0] sum;
	wire carry;
	//wire[N-1:0]c;
	integer seed = 15;

	fa_multi_1b #(N)dut(.*);

	initial begin
		repeat(5) begin

			{a, b, cin} = $random;
			#1;
			$display("A = %b, B = %b, Cin = %b, Sum = %b, Carry = %b", a, b, cin, sum, carry);

		end
	end
endmodule
