`timescale 1ns / 1ps
module apb1_protocol #(datawidth = 16,
addresswidth = 8) (
input clk,
input rst_n,
input [addresswidth-1:0]paddr,
input [datawidth-1:0] pwdata,
input pwrite,
input psel,
input penable,
 output reg [datawidth-1:0]prdata
);

reg [datawidth-1:0] mem[31:0];

reg [1:0] state;
reg [1:0] IDLE = 0;
reg [1:0] SETUP = 1;
reg [1:0] WRITE = 2;
reg [1:0] READ = 3;
reg pready = 0;

always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
 prdata <= 0;
 state <= SETUP; 
 end else begin
 case(state)
 SETUP : begin
 prdata <= 0;
 if (psel & !penable) begin
 if (pwrite) begin
 state <= WRITE;
 end else begin
 state <= READ;
 end
 end
 end
 WRITE: begin
 if (psel & penable & pwrite) begin
 mem[paddr] <= pwdata; 
 end
 state <= SETUP; 
 end
 READ : begin
 if (psel & penable & !pwrite) begin
 prdata <= mem[paddr];
 end
 state <= SETUP;
 end
 endcase
 end

end

endmodule
