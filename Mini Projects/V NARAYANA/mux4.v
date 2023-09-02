`timescale 1ns / 1ps


module mux4(a,s0,s1,y);
input [3:0]a; input s0,s1; output y;
assign y = ((a[0]&~s1&~s0)|(a[1]&~s1&s0)|(a[2]&s1&~s0)|(a[3]&s1&s0));
endmodule
