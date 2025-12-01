// The design module - Full Adder(1bit)
module fa(sum, carry, a, b ,cin);
	input a, b;
	input cin;
	output sum;
	output carry;

	assign {carry, sum} = a+b+cin;

endmodule

//The design module - Full Adder(4Bit using 1Bit)
module fa_4b_1b(sum, carry, a, b, cin);
	input [3:0]a, b;
	input cin;
	output [3:0]sum;
	output carry;
	wire c1, c2, c3;

	fa fa1(sum[0], c1, a[0], b[0], cin);	
	fa fa2(sum[1], c2, a[1], b[1], c1);	
	fa fa3(sum[2], c3, a[2], b[2], c2);	
	fa fa4(sum[3], carry, a[3], b[3], c3);	
	
endmodule

//The Test bench - Full Adder(4Bit using 1Bit)
module tb;	
	reg [3:0]a, b;
	reg cin;
	wire [3:0]sum;
	wire carry;

	fa_4b_1b dut(.*);

	initial begin
		repeat(10) begin
			{a, b, cin} = $random;
			#1;
			$display("A = %b, B = %b, Cin = %b, Sum = %b, Carry = %b", a, b, cin, sum, carry);
		end
	end
endmodule
