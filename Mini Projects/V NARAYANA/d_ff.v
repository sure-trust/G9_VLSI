`timescale 1ns / 1ps
module dfp(output reg q,
input d,input rst,input clk);
always @(*)
if(rst==1)
q = 0;
else 
 q = d;
endmodule
