`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 01:03:24
// Design Name: 
// Module Name: crylkadr
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


module crylkadr(
 input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [4:0] Sum,
    output wire Cout
);

wire [3:0] P, G;
wire [3:0] C;

assign P = A ^ B;
assign G = A & B;

assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & Cin);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);

assign Sum = A + B + Cin;
assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);

endmodule

