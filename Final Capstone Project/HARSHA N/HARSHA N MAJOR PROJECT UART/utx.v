`timescale 1ns / 1ps
module uart (
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,
    output reg tx_busy,
    output reg tx_done,
    output reg tx_ack,
    output [7:0] rx_data,
    input rx_ready
);
reg tx_busy;
     reg tx_done;
     reg tx_ack;
     reg [7:0] rx_data;
    reg [3:0] tx_state;
    reg [3:0] rx_state;
    reg [2:0] bit_count;
    reg [9:0] tx_shift_reg;
    reg [9:0] rx_shift_reg;
    reg rx_data_ready;
     parameter IDLE = 4'b0000;
    parameter START = 4'b0001;
    parameter DATA = 4'b0010;
    parameter STOP = 4'b0011;

    always @(posedge clk or posedge rst) begin
        if (rst)
            tx_state <= IDLE;
        else
            case (tx_state)
                IDLE: tx_state <= tx_start ? START : IDLE;
                START: tx_state <= DATA;
                DATA: tx_state <= bit_count == 7 ? STOP : DATA;
                STOP: tx_state <= IDLE;
                default: tx_state <= IDLE;
            endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_count <= 0;
            tx_shift_reg <= 10'b0;
            tx_busy <= 0;
            tx_done <= 0;
            tx_ack <= 0;
        end else begin
            case (tx_state)
                IDLE: begin
                    tx_busy <= 0;
                    tx_done <= 0;
                    tx_ack <= 0;
                end
                START: begin
                    tx_busy <= 1;
                    tx_shift_reg <= {1'b0, tx_data, 1'b1};
                    bit_count <= 0;
                    tx_ack <= 1;
                end
                DATA: begin
                    tx_shift_reg <= {tx_shift_reg[8:0], tx_data[bit_count]};
                    bit_count <= bit_count + 1;
                    tx_ack <= 1;
                end
                STOP: begin
                    tx_busy <= 0;
                    tx_done <= 1;
                    tx_ack <= 1;
                end
                default: begin
                    tx_busy <= 0;
                    tx_done <= 0;
                    tx_ack <= 0;
                end
            endcase
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_state <= IDLE;
            rx_shift_reg <= 10'b0;
            rx_data_ready <= 0;
        end else begin
            case (rx_state)
                IDLE: begin
                    rx_state <= rx_ready ? START : IDLE;
                    rx_shift_reg <= 10'b0;
                    rx_data_ready <= 0;
                end
                START: begin
                    rx_state <= DATA;
                    rx_data_ready <= 0;
                end
                DATA: begin
                    rx_shift_reg <= {rx_shift_reg[8:0], rx_ready};
                    bit_count <= bit_count + 1;
                    rx_data_ready <= 1;
                    rx_state <= bit_count == 7 ? STOP : DATA;
                end
                STOP: begin
                    rx_data_ready <= 0;
                    rx_state <= IDLE;
                end
                default: begin
                    rx_state <= IDLE;
                    rx_shift_reg <= 10'b0;
                    rx_data_ready <= 1;
                end
            endcase
        end
    end
    assign tx_data=rx_data;
 //assign #40 rx_data=8'hdb;

endmodule
