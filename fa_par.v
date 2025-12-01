`timescale 1ns/1ps
module fa_par(a, b ,cin, sum, carry);
	parameter N = 4;
	input [N-1:0]a, b;
	input cin;
	output [N-1:0]sum;
	output carry;
	assign {carry, sum} = a+b+cin;
endmodule

module tb_fa_par;
    integer seed = 111;
	parameter N = 16;
	reg [N-1:0]a, b;
	reg cin;
	wire [N-1:0]sum;
	wire carry;
	fa_par #(N)dut(a,b,cin,sum,carry);

	initial begin
		repeat(10) begin
			{a, b, cin} = $random;
			#1;
			$display("a=%b, b=%b, cin=%b, Sum=%b, Carry=%b", a, b, cin, sum, carry);
		end
		//#10;
		$finish;
	end
endmodule
