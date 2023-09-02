`timescale 1ns / 1ps
module lfsr5b(clk,rst,lfsr  );
input rst,clk; output reg [4:0]lfsr;
always @(posedge clk)
begin
if(rst==1)
lfsr <=5'b11111;
else 
lfsr <={lfsr[3:0],lfsr[4]^lfsr[3]}; 
end
endmodule
