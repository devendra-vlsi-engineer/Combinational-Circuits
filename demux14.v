// The design module - Demux(1x4)
module demux14(i, s, d, c, b, a);
	input i;
	input [1:0]s;
	output a, b, c, d;

	assign {d, c, b, a} = (s == 2'b00)?({1'b0, 1'b0, 1'b0, i}):
						  (s == 2'b01)?({1'b0, 1'b0, i, 1'b0}):
						  (s == 2'b10)?({1'b0, i, 1'b0, 1'b0}):
						  			   ({i, 1'b0, 1'b0, 1'b0});

endmodule

//The testbench - Demux(1x4)
module tb;
	reg i; 
	reg [1:0]s;
	wire a, b, c, d;
	integer seed = 111;

	demux14 dut(.*);
	
	initial begin
		repeat(5) begin
			{s, i} = $random(seed);
			#1;
			$display("S = %b; D = %b; C = %b; B = %b; A = %b; I = %b", s, d, c, b, a, i);
		end
	end

endmodule
