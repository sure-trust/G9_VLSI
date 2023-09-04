`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:43 08/26/2023 
// Design Name: 
// Module Name:    moore_sequenc_detector 
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
module moore_sequence_detector_nol(input clk, rst, x, output y);
  parameter A = 3'b000;
  parameter B = 3'b001;
  parameter C = 3'b010;
  parameter D = 3'b100;
  parameter E = 3'b011; // extra state when compared with Mealy Machine
  
  reg [2:0] ps, ns;
  always @(posedge clk or negedge rst) begin
    if(!rst) begin 
      ps <= A;
    end
    else ps <= ns;
  end
  
  always @(ps or x) begin
    case(ps)
      A: begin
           if(x == 0) ns = A;
           else       ns = B;
         end
      B: begin
           if(x == 0) ns = C;
           else       ns = B;
         end
      C: begin
           if(x == 0) ns = D;
           else       ns = B;
         end
      D: begin
           if(x == 0) ns = A;
           else       ns = E;
         end
      E: begin
           if(x == 0) ns = A;
           else       ns = B; //This state only differs when compared with Moore Overlaping Machine
         end
      default: ns = A;
    endcase
  end
  assign y = (ps == E)? 1:0;
endmodule
