`include ha.v
module tb;

reg a, b;
wire sum, carry;

ha dut(a, b, sum, carry);
	
	initial begin
		a = $random;
		b = $random;
		#1;
		$display("a=%0b, b=%0b, sum=%0b, carry=%0b", a, b, sum, carry);
	end

endmodule
