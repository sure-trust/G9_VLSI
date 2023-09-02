`timescale 1ns / 1ps
module alu(input [3:0] A, input [3:0] B, input [2:0] OpCode, output reg [3:0] ALU_Result, output reg Zero);
always @ (A or B or OpCode) begin
        case (OpCode)
            3'b000: ALU_Result <= A + B;  // Addition
            3'b001: ALU_Result <= A - B;  // Subtraction
            3'b010: ALU_Result <= A & B;  // Bitwise AND
            3'b011: ALU_Result <= A | B;  // Bitwise OR
            3'b100: ALU_Result <= A ^ B;  // Bitwise XOR
            default: ALU_Result <= 4'b0;				// Default case
				endcase
        end
initial begin if (ALU_Result == 4'b0)begin
            Zero <= 1'b1;
				end
        else begin
            Zero <= 1'b0;
 end
 end
endmodule


