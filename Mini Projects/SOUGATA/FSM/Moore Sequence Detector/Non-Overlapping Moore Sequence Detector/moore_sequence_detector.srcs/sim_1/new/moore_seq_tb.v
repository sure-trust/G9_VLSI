`timescale 1ns / 1ps
module moore_seq_tb();
wire out;
reg clk,rst,in;
moore dut(out,clk,rst,in);
initial
begin
rst=1;
clk=0;
in=0;
#20 rst=0;
in=1;
#20 in=0;
#20 in=1;
#20 in=1;
#20 in=0;
#20 in=0;
#20 in=1;
#20 in=1;
#20 in=0;
#20 in=1;
#20 in=0;
#20 in=0;
#20 in=0;
#20 in=1;
#20 in=1;
#20 in=0;
#20 in=1;
#20 in=0;
#20 in=1;
#20 in=0;
#20 in=1;
#20 in=0;
$monitor("time=%t out=%b clk=%b rst=%b in=%b",$time,out,clk,rst,in);
#600 $finish();
end
always #10 clk=~clk;
//always #20 in= $random;
endmodule
