// The design module - Converter(Bin - Gray)
module gray_to_bin (g, b);
	parameter N = 4;
    input  [N-1:0] g;
    output reg [N-1:0] b;

    integer i;
    always @(*) begin
        b[N-1] = g[N-1];
        for (i = N-2; i >= 0; i = i - 1) begin
            b[i] = g[i] ^ b[i+1];
        end
    end
endmodule

// The Testbench - Converter(Gray to Bin)
module tb;
    parameter N = 4;
    reg [N-1:0] g;
    wire [N-1:0] b;

    gray_to_bin #(N) dut (.g(g), .b(b));

    initial begin
        $display("\n-----: Output :-----\n");
        repeat(10) begin
            g = $random;
            #1;
            $display("Input(Gr) = %b, Output(Bi) = %b", g, b);
        end
        $display("\n-----: The End :-----");
    end
endmodule

