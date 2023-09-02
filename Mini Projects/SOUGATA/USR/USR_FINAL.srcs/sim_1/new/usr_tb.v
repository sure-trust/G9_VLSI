`timescale 1ns / 1ps
module usr_tb();
wire [3:0] p_out;
wire [3:0] p_out_bar;
reg  [3:0] p_in ;
reg  rst, clk, s_right, s_left;
reg [1:0]s;

usr dut(p_out,p_out_bar,p_in,rst,clk,s_right,s_left,s);
initial begin
rst =1;
clk=0;
s_left =0;
s=2'b00;
s_left=0;
s_right=1;
#20 rst = 0;
$monitor("p_out=%b p_out_bar=%b p_in=%b rst=%b clk=%b s_right=%b s_left=%b",p_out,p_out_bar,p_in,rst,clk,s_right,s_left);
#1000 $finish;
end
always #10 clk =~clk;
always #40 p_in=$random;
always #400 s_right = ~s_right;
always #400 s_left = ~s_left;
always #50 s[0]=~s[0];
always #100 s[1]=~s[1];
endmodule

