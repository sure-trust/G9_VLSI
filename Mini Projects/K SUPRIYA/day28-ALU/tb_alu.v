`timescale 1ns / 1ps
module tb_alu;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [2:0] OpCode;

	// Outputs
	wire [3:0] ALU_Result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.OpCode(OpCode), 
		.ALU_Result(ALU_Result), 
		.Zero(Zero)
	);

	initial begin
		 A = 4'b1010;
        B = 4'b0011;
        OpCode = 3'b000; // Addition
        #10;
		
         $display("%b\t%b\t%b\t%b\t%d", A, B, OpCode, ALU_Result, Zero);
 $finish;

	end
      
endmodule

