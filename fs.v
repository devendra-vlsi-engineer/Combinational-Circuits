// The design module - Full subtractor(1bit)
module fs(diff, bar, a, b, bin);
	
	input a, b, bin;
	output diff, bar;

	assign {bar, diff} = a - b - bin;

endmodule

// The testbench - Full subtractor(1bit)
module tb;
	reg a, b, bin;
	wire diff, bar;

	fs dut(.*);

	initial begin
		repeat(5) begin
			{a, b, bin} = $random;
			#1;
			$display("A = %b, B = %b, Bin = %b, Diff = %b, Barrow = %b", a, b, bin, diff, bar);
		end
	end

endmodule
