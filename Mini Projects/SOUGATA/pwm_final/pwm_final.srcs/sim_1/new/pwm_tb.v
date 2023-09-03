
`timescale 1ns / 1ps

module pwm_tb();
parameter r=8;
wire out;
reg [r-1:0]duty;
reg rst,clk;
pwm dut(out,duty,rst,clk);
initial
begin
rst=1;
clk=0;
duty=0;
#10 rst=0;
duty='d60;
#2560 duty='d20;
end

always #5 clk=~clk;
endmodule

