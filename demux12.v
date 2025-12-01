// The design module - Demux(1x2)
module demux12(i, s, b, a);
	input i, s;
	output b, a;

	//assign {b, a} = s?({i, 1'b0}):({1'b0, i});
	assign {b, a} = i << s;  //easiest way to assign

endmodule

//The testbench - Demux(1x2)
module tb;
	reg i, s;
	wire a, b;
	integer seed = 111;

	demux12 dut(.*);
	
	initial begin
		repeat(5) begin
			{i, s} = $random(seed);
			#1;
			$display("I = %b; S = %b, B = %b; A = %b", i, s, b, a);
		end
	end

endmodule
