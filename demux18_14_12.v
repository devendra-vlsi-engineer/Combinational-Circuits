// The design module - Demux(1x8 using 1x4)
`include "demux14.v"
`include "demux12.v"
module demux18_14_12(i, s, a, b, c, d, e, f, g, h);
	input i;
	input [2:0]s;
	output a, b, c, d, e, f, g, h;
	wire w1, w2;

	demux12 dx1(i, s[2], w2, w1);
	demux14 dx2(w1, {s[1], s[0]}, d, c, b, a);
	demux14 dx3(w2, {s[1], s[0]}, h, g, f, e);

endmodule

// The Test bench - Demux(1x8 using 1x4 and 1x2)
module tb;	
	reg i;
	reg [2:0]s;
	wire a, b, c, d, e, f, g, h;
	
	demux18_14_12 dut(.*);

	initial begin
		repeat(10) begin
			{i, s} = $random;
			#1;
			$display("S = %b; H = %b; G = %b; F = %b; E = %b; D = %b; C = %b; B = %b; A = %b; I = %b", s, h, g, f, e, d, c, b, a, i);
		end
	end

endmodule
