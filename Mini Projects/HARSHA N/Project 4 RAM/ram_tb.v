`timescale 1ns / 1ps
module ram_tb();
reg clk,rst,w,r;
reg [3:0] d_i;
reg [7:0] ad;
wire [3:0] d_o;
ram m1(clk,rst,w,r,d_i,ad,d_o);
initial
begin
clk=0;
rst=0;
w=0;
r=0;
ad=0;
d_i=0;
#50;
rst=1;
w=1;
r=0;
d_i=4'b0001;
ad=4'b0001;
#10;
d_i=4'b0010;
ad=4'b0010;
#10;
d_i=4'b0110;
ad=4'b0110;
#10;
r=1;
w=0;
ad=4'b0001;
#10;
ad=4'b0010;
#10;
ad=4'b0110;
#10;
ad=4'b0001;
#10;
ad=4'b0010;
#10;
ad=4'b0110;
#10;
end
always #5 clk=~clk;
initial
begin
#200 $finish;
end
endmodule
