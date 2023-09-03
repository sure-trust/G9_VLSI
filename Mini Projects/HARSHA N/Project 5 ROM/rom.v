`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2023 15:26:37
// Design Name: 
// Module Name: rom
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


module rom(input [7:0] addr,
input rst,clk,output [3:0] d_o);
reg [3:0]d_o;
always @(posedge clk)
begin
if(rst==0)
d_o=0;
else
if(rst==1)
 case(addr)
 8'b00000001:d_o=4'b0110;
 8'b00000010:d_o=4'b1100;
 8'b00000011:d_o=4'b1110;
 8'b00000100:d_o=4'b0101;
 8'b00000101:d_o=4'b1001;
 endcase
 end
endmodule
