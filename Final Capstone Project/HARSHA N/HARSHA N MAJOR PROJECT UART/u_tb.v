`timescale 1ns / 1ps
module testbench;
    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx_busy;
    wire tx_done;
    wire tx_ack;
    wire [7:0] rx_data;
    reg rx_ready;
    uart a1 (clk,rst,tx_start,tx_data,tx_busy,tx_done,tx_ack,rx_data,rx_ready);
     initial begin
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'b11011011; 
        #10 rst = 0;
        #10 tx_start = 1;
        #20 rx_ready=1;
        #200 $finish;
    end
    always #5 clk=~clk;
endmodule