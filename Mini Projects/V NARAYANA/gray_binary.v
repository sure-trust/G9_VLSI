`timescale 1ns / 1ps
module gray_binary(b,g);
input [7:0]g;
output reg [7:0]b;
always@(*) begin
b[7] = g[7];
b[6] = g[6]^g[7];
b[5] = g[5]^g[6]^g[7];
b[4] = g[4]^g[5]^g[6]^g[7];
b[3] = g[3]^g[4]^g[5]^g[6]^g[7];
b[2] = g[2]^g[3]^g[4]^g[5]^g[6]^g[7];
b[1] =g[1]^ g[2]^g[3]^g[4]^g[5]^g[6]^g[7];
b[0] =g[0]^g[1]^ g[2]^g[3]^g[4]^g[5]^g[6]^g[7];
end
endmodule
