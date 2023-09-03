`timescale 1ns / 1ps
module ringcou(clk,rst,counter);
input rst,clk;output  [2:0]counter; reg[3:0]count;
always @(posedge clk)begin
if(rst == 1)
count <=3'b001; 
else 
count <= {count[1:0],count[2]};
end
assign counter = count;
endmodule
