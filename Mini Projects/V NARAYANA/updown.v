`timescale 1ns / 1ps
module updown #(parameter N = 3 ,parameter width =2 )(clk,rst,count,updown);
input clk,rst,updown;
output reg [width - 1:0]count;
always @(posedge clk)
begin 
if(rst == 1)
count <=0 ;
else   if(updown ==1)
count = count + 1; 
else 
count = count - 1; end
assign  counter = count;
endmodule
