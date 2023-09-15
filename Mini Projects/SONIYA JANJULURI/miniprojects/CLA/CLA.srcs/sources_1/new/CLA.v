`timescale 1ns / 1ps


module CLA(input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout
);
wire [3:0] P, G;
  wire [3:0] C;

  assign P = A ^ B;
  assign G = A & B;

  assign C[0] = Cin;
  assign C[1] = G[0] | (P[0] & Cin);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
  assign Sum = P ^ Cin;
  assign Cout = C[3];


endmodule