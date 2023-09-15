`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 23:40:50
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_tb( );

parameter width=8;
 parameter depth=16; 
 integer i;

// Inputs
 reg clk;
reg [7:0] Data_in; 
reg rst;
reg wr_en; 
reg rd_en;

// Outputs
wire [7:0] Data_out; 
wire full;
wire empty;
 
always#5 clk = ~clk;

// Instantiate the Unit Under Test (UUT) 
fifo uut (
.clk(clk),
.Data_in(Data_in),
.Data_out(Data_out),
.rst(rst),
.wr_en(wr_en),
.rd_en(rd_en),
.full(full),
.empty(empty)
);


task initialise;
begin 
clk = 0;
Data_in = 0;
rst = 0;
wr_en = 0;
rd_en = 0; 
end
endtask

 
task reset;
begin
 @(negedge clk) rst<=1; 
@(negedge clk) rst<=0;
 end
 endtask

task write(input [width-1:0]D); 
begin
 @(negedge clk) Data_in<=D;
 
end 
endtask
 
initial
 begin
 initialise; 
 reset; 
 wr_en<=1;
 
for(i=0;i<depth;i=i+1)
begin
write($random);
end
  wr_en<=0; 
rd_en<=1;
 #100;
 end
endmodule
