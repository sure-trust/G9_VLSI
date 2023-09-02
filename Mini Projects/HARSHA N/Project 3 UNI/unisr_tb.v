`timescale 1ns / 1ps
module unisr_tb();
wire [3:0] o;
reg [3:0] p_in;
reg [1:0] s;
reg rst;
reg l_in;
reg r_in;
reg clk;
unisr u1(o,p_in,s,rst,l_in,r_in,clk);
initial
begin
p_in=0;
s=0;
clk=0;
l_in=0;
r_in=0;

rst=1;
#10;
rst=0;#20;
r_in=1;s=2'b01;#10;
l_in=0;s=2'b10;#10;
p_in=4'b1010;s=2'b11;#10;
$finish;
end
always #5 clk=~clk;
endmodule
