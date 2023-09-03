`timescale 1ns / 1ps
module binary_gray(g,b);
input [7:0]b;
output reg [7:0]g;
always@(*) begin
g[7] = b[7];
g[6] = b[6]^b[7];
g[5] = b[5]^b[6]^b[7];
g[4] = b[4]^b[5]^b[6]^b[7];
g[3] = b[3]^b[4]^b[5]^b[6]^b[7];
g[2] = b[2]^b[3]^b[4]^b[5]^b[6]^b[7];
g[1] = b[1]^b[2]^b[3]^b[4]^b[5]^b[6]^b[7];
g[0] = b[0]^b[1]^b[2]^b[3]^b[4]^b[5]^b[6]^b[7];
end
endmodule
