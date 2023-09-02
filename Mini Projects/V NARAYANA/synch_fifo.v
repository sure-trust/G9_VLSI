`timescale 1ns / 1ps
module synch_fifo #(parameter DATA_WIDTH = 8,
parameter DEPTH = 8)
(   input  clk,
    input  reset,
    input  write,
    input  read,
    input  [DATA_WIDTH-1:0] data_in,
    output reg[DATA_WIDTH-1:0] data_out,
    output full,
    output  empty);
reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1];
reg [DEPTH-1:0] write_ptr;
reg [DEPTH-1:0] read_ptr;
always @(posedge clk or posedge reset) begin
    if (reset)
        write_ptr <= 0;
    else if (write && !full)
        write_ptr <= write_ptr + 1;
end
always @(posedge clk or posedge reset) begin
    if (reset)
        read_ptr <= 0;
    else if (read && !empty)
        read_ptr <= read_ptr + 1;
end
always @(posedge clk) begin
    if (write && !full)
        fifo[write_ptr] <= data_in;
end
always @(posedge clk) begin
    if (read && !empty)
        data_out <= fifo[read_ptr];
end

 assign full = (write_ptr == (DEPTH - 1)) ? 1'b1 : 1'b0;
assign empty = (write_ptr == read_ptr) ? 1'b1 : 1'b0;

endmodule

