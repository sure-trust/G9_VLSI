`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: asyncho_fifo
//////////////////////////////////////////////////////////////////////////////////

module asyncho_fifo(
    input wire clk,
    input wire rst_n,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    output wire empty,
    output wire full);
parameter DEPTH = 16;
reg [7:0] fifo [0:DEPTH-1];
reg [3:0] wr_ptr = 0;
reg [3:0] rd_ptr = 0;
reg [3:0] count = 0;
assign data_out = fifo[rd_ptr];
assign empty = (count == 0);
assign full = (count == DEPTH);
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0;
    end else begin
        if (wr_en && ~full) begin
            fifo[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end
        if (rd_en && ~empty) begin
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end
    end
end
endmodule