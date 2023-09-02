`timescale 1ns / 1ps
module decoder_2to4(output [3:0] y, 
input [1:0]a );
 assign y[0] = (~a[1])&(~a[0]);
 assign y[1] = (~a[1])&a[0];
 assign y[2] = a[1]&(~a[0]);
 assign y[3] = a[1]&a[0];
endmodule
