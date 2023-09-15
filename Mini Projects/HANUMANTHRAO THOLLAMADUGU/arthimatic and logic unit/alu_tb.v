`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu_tb; 
reg [7:0]a,b; 
reg [2:0]sel; 
wire[15:0]y; 
alu uut(a,b,sel,y); 
initial 
begin 
a=8'h85; 
b=8'hc2; 
 sel=3'b000; 
 #10 sel=3'b001; 
 #10 sel=3'b010; 
 #10 sel=3'b011; 
 #10 sel=3'b100;
 #10 sel=3'b101; 
 #10 sel=3'b110; 
 #10 sel=3'b111; 
 end 
 initial 
 #200 $finish; 
endmodule 


