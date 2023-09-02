`timescale 1ns / 1ps
module asynch_fifo(
    input wire clk,
    input wire rst,
    input wire wr,
    input wire rd,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    output wire empty,
    output wire full
);  parameter DEPTH = 16;
    reg [7:0] memory [0:DEPTH-1];
    reg [3:0] wr_ptr = 0;
    reg [3:0] rd_ptr = 0;
    reg empty_reg;
    reg full_reg;
    assign empty = empty_reg;
    assign full = full_reg;
    assign data_out = memory[rd_ptr];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            empty_reg <= 1;
            full_reg <= 0;
        end else begin
            if (wr && !full_reg) begin
                memory[wr_ptr] <= data_in;
                wr_ptr <= (wr_ptr == DEPTH-1) ? 0 : wr_ptr + 1;
            end

            if (rd && !empty_reg) begin
                rd_ptr <= (rd_ptr == DEPTH-1) ? 0 : rd_ptr + 1;
            end

            empty_reg <= (wr_ptr == rd_ptr);
            full_reg <= ((wr_ptr + 1) % DEPTH == rd_ptr);
        end
    end

endmodule
