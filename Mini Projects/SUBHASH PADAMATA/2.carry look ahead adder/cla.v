`timescale 1ns / 1ps

module cla(input1,input2,output_sum);

  input [3:0]input1, input2;
  output [4:0]output_sum;

  wire [4:0]carry; //Intermediate carry signals
  wire [3:0]propagate,gen; //Propagate and generate signals

  assign propagate = input1 ^ input2;
  assign gen = input1 & input2;

  assign carry[0] = 1'b0;
  assign carry[1] = (propagate[0] & carry[0]) | gen[0];
  assign carry[2] = (propagate[1] & carry[1]) | gen[1];
  assign carry[3] = (propagate[2] & carry[2]) | gen[2];
  assign carry[4] = (propagate[3] & carry[3]) | gen[3];

  assign output_sum[0] = propagate[0] ^ carry[0];
  assign output_sum[1] = propagate[1] ^ carry[1];
  assign output_sum[2] = propagate[2] ^ carry[2];
  assign output_sum[3] = propagate[3] ^ carry[3];
  assign output_sum[4] = carry[4];

endmodule
