`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 10:46:52
// Design Name: 
// Module Name: ramm_tb
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


module ramm_tb();
reg clk;
reg wr_en;
reg [3:0]addr;
reg [7:0]din;
wire [7:0]dout;

ramm dut(.clk(clk), .wr_en(wr_en), .addr(addr), .din(din), .dout(dout));
initial begin
clk=0;
wr_en=1;
addr=4'b0000;
din=8'b00001000;
#5
wr_en=0;
addr=4'b0001;
din=8'b00000111;
#5
wr_en=1;
addr=4'b0010;
din=8'b00000110;
#5
wr_en=0;
addr=4'b0011;
din=8'b00000001;
#10;
$stop;
end
always #5 clk=~clk;

endmodule
