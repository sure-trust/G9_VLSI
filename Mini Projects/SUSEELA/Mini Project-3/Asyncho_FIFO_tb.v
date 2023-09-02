`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: asyncho_fifo_tb
//////////////////////////////////////////////////////////////////////////////////

module asyncho_fifo_tb;
    reg clk;
    reg rst_n;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire empty;
    wire full; 
    asyncho_fifo uut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full));
    initial begin
        clk = 0;
        rst_n = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #10 rst_n = 1;
        wr_en = 1;
        data_in = 8'hAA;
        #20;
        data_in = 8'h55;
        #20;
        wr_en = 0;
        rd_en = 1;
        #20;
        rd_en = 0;
        #100 $finish;
    end
    always #5 clk = ~clk;
endmodule