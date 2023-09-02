`timescale 1ns / 1ps

module ram(input clk,rst,w,r,
input [3:0] d_i,
input [7:0] ad,output [3:0] d_o);
reg [3:0]d_o;
reg[3:0] mem[255:0];
always @(posedge clk)
begin
if(rst==0)
d_o=4'bx;
else 
 if(w)
 mem[ad]=d_i;
  if(r)
 d_o=mem[ad];
end
endmodule
