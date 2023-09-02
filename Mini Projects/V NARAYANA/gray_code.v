`timescale 1ns / 1ps
module gray_code  ( clk,inp ,outp);
input [2:0]inp; input clk; output reg[3:0]outp;
always@(*)
begin
case(inp)
 0:outp=0;     
 1:outp=1;   
 2:outp=3;    
 3:outp=2;   
 4:outp=6;     
 5:outp=7;      
 6:outp=5;      
 7:outp=4;      
 endcase
end
endmodule
  