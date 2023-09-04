`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:08 08/26/2023 
// Design Name: 
// Module Name:    Universal_Shift_Register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module universal_sr(input clr,clk,input [1:0]sel,input [3:0]M,output reg [3:0]Q);
always @(negedge clk)begin
  if(clr)
  Q=4'b0000;
  else begin
  case(sel)
    2'b00: Q=Q;
    2'b01: Q={M[0],M[3:1]};
    2'b10: Q={M[2:0],M[3]};
    2'b11: Q=M;
  endcase
  end
end
endmodule

