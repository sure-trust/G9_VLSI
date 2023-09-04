`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2023 11:51:17
// Design Name: 
// Module Name: Ram
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


module ram(
Clk,
wr_en,
rd_en,
Addr,
Data
);
input Clk, wr_en, rd_en;
input [3:0] Addr;
inout [7:0] Data;
reg [7:0] temp_data;
reg [7:0] MEMORY [15:0];
assign Data = (rd_en && !wr_en)? temp_data: 8'bzzzzzzzz; 
always@(posedge Clk)
begin
if(wr_en && !rd_en) 
MEMORY[Addr] <= Data;
else if (rd_en && !wr_en) 
temp_data <= MEMORY[Addr];
end 
endmodule





