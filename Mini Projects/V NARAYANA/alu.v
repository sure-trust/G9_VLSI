`timescale 1ns / 1ps
module alu(a,b,sel,alu_out);
input [3:0]a,b;
input[3:0]sel;
output reg [3:0]alu_out;
always@(*)
begin 
case(sel)
 4'b0000:alu_out =0;
 4'b0001:alu_out =a+b;
 4'b0010:alu_out =a-b;
 4'b0011:alu_out =a*b;
 4'b0100:alu_out =a/b;
 4'b0101:alu_out =a<<1;
 4'b0110:alu_out =b>>1;
 4'b0111:alu_out =a&b;
 4'b1000:alu_out =a|b;
 4'b1001:alu_out =a^b;
 4'b1010:alu_out =~(a|b);
 4'b1011:alu_out =~(a^b);
 4'b1100:alu_out =~(a&b);
 4'b1101:alu_out =~b;
 4'b1110:alu_out =~a;
endcase
end
endmodule
