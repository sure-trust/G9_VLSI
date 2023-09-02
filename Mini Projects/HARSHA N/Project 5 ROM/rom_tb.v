`timescale 1ns / 1ps
module rom_tb();
reg [7:0]addr;
reg clk,rst;
wire [3:0]d_o;
rom r1(addr,rst,clk,d_o);
initial
begin
clk=0;
addr=0;
rst=0;
#20;

rst=1;#10;
addr= 8'b00000001;#10;
addr= 8'b00000010;#10;
addr=8'b00000011;#10;
 addr=8'b00000100;#10;
 addr=8'b00000101;#10;
 $finish;
 end
 always #5 clk=~clk;
endmodule
