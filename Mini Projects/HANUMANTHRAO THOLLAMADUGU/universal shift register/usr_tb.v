`timescale 1ns / 1ps
module usr_tb;
reg clc;
reg clear;
reg left_in;
reg right_in;
reg [1:0]sel;
reg [3:0]par_in;
wire [3:0]out;
usr uut(clc,clear,left_in,right_in,par_in,sel,out);
always #20 clc=~clc;
initial begin
clear=0; clc=0; left_in=0; right_in=0; par_in=0;  sel=0; 
#10;
clear=1'b1; 
 #10;
clear=1'b0;
  #40;
right_in=1'b1; sel=2'b01;
#40;
left_in=1'b0; sel=2'b10;
#40;
par_in=4'b1010; sel=2'b11;
end
endmodule
