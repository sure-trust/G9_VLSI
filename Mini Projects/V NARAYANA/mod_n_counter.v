`timescale 1ns / 1ps
module mod_n_counter #(parameter N= 15,parameter W=4)
(clk,rst,count);
output  reg [W-1:0]count;
input clk,rst;
always @(posedge clk)begin
if(rst)begin
count <= 0;end
else begin
count <= count + 1;
//count <= count - 1;
   if(count ==(N-1))begin
   count =0; end end end
endmodule
