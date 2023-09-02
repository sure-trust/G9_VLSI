`timescale 1ns / 1ps

module alu_tb();
reg [31:0]a;
reg [31:0]b;
reg [2:0]fun;
wire [31:0]y;
alu m1 (a,b,fun,y);
initial 
begin
#10 a=32'h00000010;b=32'h00000110;fun=3'b000;
#10 a=32'h00000110;b=32'h00001000;fun=3'b001;
#10 a=32'h00001010;b=32'h00000111;fun=3'b010;
#10 a=32'h000001011;b=32'h00001001;fun=3'b011;
#10 a=32'h00001001;b=32'h00000110;fun=3'b100;
#10 a=32'h00000010;fun=3'b101;
#10 a=32'h00001000;b=32'h00001000;fun=3'b110;
#10 a=32'h00000010;b=32'h00000010;fun=3'b111;
#100 $finish;
end
endmodule
