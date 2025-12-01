// The design - Comparator(1bit)
module comp1b(y, a, b);
	input a, b;
	output reg [23:0]y;

	assign y = (a>b)?"A>B":((a<b)?"A<B":"A=B");

endmodule

// The design - Comparator(2bit)
module comp2b(y, a, b);
	input [1:0]a, b;
	output reg [23:0]y;

	assign y = (a[1]>b[1])?"A>B":
			   (a[1]<b[1])?"A<B":
			   (a[0]>b[0])?"A>B":
			   (a[0]<b[0])?"A<B":"A=B";

endmodule

// The design - Comparator(3bit using 2bit, 1bit)
module comp3b_2b_1b(y, a, b);
	input [2:0]a, b;
	output reg [23:0]y;
	wire [23:0]y_2bit, y_1bit;
	
	comp2b dut1(y_2bit, a[2:1], b[2:1]);
	comp1b dut2(y_1bit, a[0], b[0]);
	
	always @(*) begin
        if(y_2bit == "A=B")
            y = y_1bit;
        else
            y = y_2bit;
    end	

endmodule

// The design - Comparator(4bit)
module comp4b(y, a, b);
	input [3:0]a, b;
	output reg [23:0]y;

	assign y = (a[3]>b[3])?"A>B":
			   (a[3]<b[3])?"A<B":
			   (a[2]>b[2])?"A>B":
			   (a[2]<b[2])?"A<B":
			   (a[1]>b[1])?"A>B":
			   (a[1]<b[1])?"A<B":
			   (a[0]>b[0])?"A>B":
			   (a[0]<b[0])?"A<B":
			   "A=B";

endmodule

// The design - Comparator(N Bit)
module compNb(y, a, b);
	parameter N = 4;
	input [N-1:0]a, b;
	output reg [23:0]y;
	integer i, found;

	always@(*) begin
		for(i = N-1; i >= 0 ; i=i-1) begin
			if(a[i]>b[i]) begin
				y = "A>B"; 
				found = 1;    //Break is not available in verilog. So, use the 
			end
			else if (a[i]<b[i]) begin
				y = "A<B";
				found = 1;
			end
		end
		if(!found) y = "A=B";
	end

endmodule

//The testbench - Comparator
module tb;
	reg [2:0]a, b;
	wire[23:0]y;
	//reg a,b;
	//reg [1:0]a, b;
	//reg [3:0]a, b;
	/*parameter N = 2;
	reg [N-1:0] a, b;
	wire [23:0]y;
	integer i;*/

	//comp1b dut(.*);
	//comp2b dut(.*);
	//comp4b dut(.*);
	//compNb #(N)dut(.*);
	comp3b_2b_1b dut(.*);

	initial begin	
		$display("\n-----: Output :-----\n");
		repeat(10) begin
			{a, b} = $random;
			#1;
			$display("A = %b, B = %b, Result => %s", a, b, y);
		end
		$display("\n-----: The End :-----");
	end

endmodule
