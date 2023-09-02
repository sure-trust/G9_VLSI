`timescale 1ns / 1ps
module usr(clk,rst,leftshift,rightshift,sel,parallelin,out);
input clk,rst,leftshift,rightshift;
input [1:0]sel;
input [3:0]parallelin;
output reg [3:0]out;
always @(posedge clk)
begin 
if(rst)
out = 4'b0000;
else begin
case(sel) 
2'b00 : out =out;             
2'b01: out = {rightshift,out[3:1]};
2'b10 : out = {out[2:0],leftshift};
2'b11: out = parallelin;
endcase
end
end
endmodule
