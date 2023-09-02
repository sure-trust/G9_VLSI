`timescale 1ns / 1ps

module unisr(output [3:0] o,input [3:0] p_in,
input [1:0] s,input rst,input l_in,input r_in,
input clk);
reg [3:0]o;
always@(posedge clk)
begin
if(rst==1)
o=0;
else
case(s)
2'b00:o=o;
2'b01:o=r_in;
2'b10:o=l_in;
2'b11:o=p_in;
endcase
end
endmodule
