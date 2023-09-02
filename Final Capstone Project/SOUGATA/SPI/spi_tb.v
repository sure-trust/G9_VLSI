

`timescale 1ns / 1ps
module spi_tb();
wire spi_cs_l;
wire spi_sclk;
wire spi_data;
wire [4:0]counter;
reg clk;
reg reset;
reg [15:0]datain;

spi dut( spi_cs_l, spi_sclk, spi_data, counter, clk, reset, datain);

initial begin
clk = 0;
reset = 1;
datain = 0;
#20 reset=0;
#20  datain=16'hF61E;
end
always #10 clk=~clk;
always #650 datain =$random;
endmodule
