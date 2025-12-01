// The Design module - ALU
module alu(y, a, b, sel);
	parameter ADD = 3'b000;
	parameter SUB = 3'b001;
	parameter MUL = 3'b010;
	parameter DIV = 3'b011;
	parameter MOD = 3'b100;
	parameter POW = 3'b101;

	input [31:0]a, b;
	input [2:0]sel;
	output reg [31:0]y;

	always @(*) begin
		case(sel)
			ADD : y = a+b;
			SUB : y = a-b;
			MUL : y = a*b;
			DIV : y = a/b;
			POW : y = a**b;
			MOD : y = a%b;
			default: y = 32'bz;
		endcase
	end

endmodule


//The testbench - ALU
module tb;
	parameter ADD = 3'b000;
	parameter SUB = 3'b001;
	parameter MUL = 3'b010;
	parameter DIV = 3'b011;
	parameter MOD = 3'b100;
	parameter POW = 3'b101;

	reg [31:0]a, b;
	reg [2:0]sel;
	wire [31:0]y;
	
	alu dut(.*);

	initial begin
		$display("\n----------: Output :----------\n");
		repeat(10) begin
			a = 10;
			b = 2;
			sel = $random;
			#1;
			$display("A = %0d, B = %0d, Operation = %b, Output = %0d", a, b, sel, y);
		end
		$display("\n----------: The End :----------\n");
	end

endmodule
