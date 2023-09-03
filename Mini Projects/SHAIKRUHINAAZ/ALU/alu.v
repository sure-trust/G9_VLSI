`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 13:15:34
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu (
           input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output Cout,
           output Result // Carry Out Flag
    );
    reg [7:0] Result;
    wire [8:0] tmp;
    assign ALU_Out = Result;
    assign tmp = {1'b0,A} + {1'b0,B};
    assign Cout = tmp[8]; //  flag
    always @(*)
    begin
        case(Sel)
        4'b0000: // Addition
           Result = A + B ; 
        4'b0001: // Subtraction
           Result = A - B ;
        4'b0010: // Multiplication
           Result = A * B;
        4'b0011: // Division
           Result = A/B;
        4'b0100: //  shift left
           Result = A<<1;
         4'b0101: //  shift right
           Result = A>>1;
         4'b1000: //  Logical and
           Result = A & B;
          4'b1001: //  Logical or
           Result = A | B;
          4'b1010: //  Logical xor 
           Result = A ^ B;
          4'b1011: //  Logical nor
           Result = ~(A | B);
          4'b1100: // Logical nand 
           Result = ~(A & B);
          4'b1101: // Logical xnor
           Result = ~(A ^ B);
          default: Result = A + B ; 
        endcase
    end

endmodule

