module half_adder(a, b, sum, carry);

input a, b;
output sum, carry;

	initial begin
		assign sum = a xor b;
		assign carry = a and b;
	end

endmodule
