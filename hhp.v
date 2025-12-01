// The design module - Higher order Higher Priority Encoder
module hhp(y, d, c, b, a);
	input a, b, c, d;
	output reg [1:0]y;

	always @(*) begin
		casez({a, b, c, d})
			4'b1zz?:y=2'b11;
			4'b01zz:y=2'b10;
			4'b001z:y=2'b01;
			4'b0001:y=2'b00;
			default:y=2'bz;
		endcase
	end

endmodule


// The design module - Lower order Higher Priority Encoder
module lhp(y, d, c, b, a);
	input a, b, c, d;
	output reg [1:0]y;

	always @(*) begin
		casez({a, b, c, d})
			4'b1000:y=2'b11;
			4'bz100:y=2'b10;
			4'bzz10:y=2'b01;
			4'bzz?1:y=2'b00;
			default:y=2'bz;
		endcase
	end

endmodule

// The Testbench - Higher/Lower Order Higher Priority Encoder
module tb;
	reg a, b, c, d;
	wire [1:0]y;

	//hhp dut(.*);
	lhp dut(.*);

	initial begin
		//$display("\n-------: Higher Order Higher Priority :-------\n");
		$display("\n-------: Lower Order Higher Priority :-------\n");
		repeat(10) begin
			{a, b, c, d} = $random;
			#1;
			$display("A = %b, B = %b, C = %b, D = %b, Y = %b", a, b, c, d, y);
		end
		$display("\n-------: The default case :-------\n");
		{a, b, c, d} = 4'b0000;
			#1;
			$display("A = %b, B = %b, C = %b, D = %b, Y = %b", a, b, c, d, y);

		    $display("\n--------------: THE END :-------------");
	end

endmodule
