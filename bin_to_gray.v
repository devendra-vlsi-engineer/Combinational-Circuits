// The design module - Converter(Bin - Gray)
module bin_to_gray (g, b);
	parameter N = 4;
    input  [N-1:0] b;
	output [N-1:0] g;

assign g[N-1] = b[N-1];  // MSB unchanged

genvar i;
generate
    for (i = N-2; i >= 0; i = i - 1) begin : xor_loop
        assign g[i] = b[i] ^ b[i+1];  // XOR adjacent bits: g[i] = b[i] XOR b[i+1]
    end
endgenerate

endmodule
	
// The Testbench - Binary to Gray converter
module tb;
parameter N = 4;
reg [N-1:0]b;
wire [N-1:0]g;

bin_to_gray #(N)dut(.*);
	initial begin	
		$display("\n-----: Output :-----\n");
		repeat(10) begin
			{b} = $random;
			#1;
			$display("Input(Bi) = %b, Output(Gr) = %b", b, g);
		end
		$display("\n-----: The End :-----");
	end

endmodule
