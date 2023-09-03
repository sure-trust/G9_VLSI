`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 23:58:03
// Design Name: 
// Module Name: fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm(
 input wire clk,
    input wire reset,
    input wire data_in,
    output reg sequence_detected
);

reg [1:0] state;


parameter IDLE = 2'b00;
parameter S0 = 2'b01;
parameter S1 = 2'b10;
parameter S2 = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else begin
        case (state)
            IDLE: if (data_in) state <= S0; else state <= IDLE;
            S0: if (!data_in) state <= S1; else state <= S0;
            S1: if (data_in) state <= S2; else state <= IDLE;
            S2: if (!data_in) state <= S0; else begin
                    state <= IDLE;
                    sequence_detected <= 1;
                    default case: 
                 end
        endcase
    end
end

endmodule




