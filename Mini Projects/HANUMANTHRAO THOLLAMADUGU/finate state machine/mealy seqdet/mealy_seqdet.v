`timescale 1ns / 1ps
module seq_detector_1010(input clk, rst_n, t, output y);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  reg [3:0] state, next_state;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin 
      state <= A;
    end
    else state <= next_state;
  end
  always @(state or t) begin
    case(state)
      A: begin
           if(t == 0) next_state = A;
           else       next_state = B;
         end
      B: begin
           if(t == 0) next_state = C;
           else       next_state = B;
         end
      C: begin
           if(t == 0) next_state = A;
           else       next_state = D;
         end
      D: begin
        if(t == 0) next_state = A; //This state only differs when compared with Mealy Overlaping Machine
           else       next_state = B;
         end
      default: next_state = A;
    endcase
  end
  assign y = (state == D)? 1:0;
endmodule