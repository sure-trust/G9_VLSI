`timescale 1ns / 1ps

module alu(a,b,sel,y); 
input [7:0]a,b; 
output reg [15:0]y; 
input [2:0]sel; 
parameter ADD=3'b000; 
parameter SUB=3'b001; 
parameter MUL=3'b010; 
parameter DIV=3'b011; 
parameter AND=3'b100; 
parameter OR=3'b101; 
parameter NOT1 =3'b110; 
parameter NOT2 =3'b111;
always@(*) 
case(sel) 
ADD: y=a+b; 
SUB: y=a-b; 
MUL: y=a*b; 
DIV: y=a/b; 
AND: y=a&&b; 
OR: y=a||b; 
NOT1: y=!a; 
NOT2: y=!b; 
endcase 
endmodule 
