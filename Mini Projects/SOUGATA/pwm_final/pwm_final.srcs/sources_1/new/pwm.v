`timescale 1ns / 1ps
module pwm#(parameter r=8)(out,duty,rst,clk);
output reg out;
input [r-1:0]duty;
input rst,clk;
reg[r-1:0]counter;
integer count=2**r;
always@(posedge clk)
begin
if(rst)
counter<=0;
else if(counter<count)
counter<=counter+1;
else
counter<=0;
end
always @(posedge clk) begin
if (counter < duty)
out<=1;
else
out<=0;
end
endmodule
