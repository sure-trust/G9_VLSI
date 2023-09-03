`timescale 1ns / 1ps
module mux2_1( a,s,y);
input [1:0]a;
input s;
output y;
assign y = ((a[0]&(~s))| (a[1]&s));
endmodule
