`timescale 1ns / 1ps
module comp4b(a,b,x);
input [0:3]a,b;
output [0:2]x;
assign x[0] = a > b;
assign x[1] = (a==b);
assign x[2] = a<b;
endmodule
