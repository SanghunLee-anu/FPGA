`timescale 1ns / 1ps


module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_counter uut (
		.q(q), 
		.clk(clk), 
		.reset(reset)
	);
	
	always
			#5 clk=~clk;

	initial 
		begin
			clk = 0;
			reset = 0;
		end
	
	
	initial 	
		begin
			reset = 1'b1;
			#15 reset = 1'b0;
			#180 reset = 1'b1;
			#10 reset = 1'b0;
			#20 $finish;
		end
			
			
	initial
			$monitor($time,"output q =%d",q);
	
endmodule

