`timescale 1ns / 1ps
module moore_seqdet_tb;
  reg clk, rst_n, t;
  wire y;
  moore_seqdet uut(clk, rst_n, t, y);
  initial clk=0;   
  always #20 clk = ~clk;
    initial begin
    t=0;
    #10 rst_n = 0;
    #20 rst_n = 1;
    #30 t = 1;
    #40 t = 1;
    #40 t = 0;
    #40 t = 1;
    #40 t = 0;
    #40 t = 1;
    #40 t = 0;
    #40 t = 1;
    #40 t = 0;
    #40 t = 1;
    #40 t = 0;
    #10;
    end
  endmodule
