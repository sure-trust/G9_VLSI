`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: carry_look_adder
//////////////////////////////////////////////////////////////////////////////////

module carry_look_adder(a,b,sum_output);
input [3:0]a;
input [3:0]b;
output[4:0]sum_output;
wire [3:0]sum;
wire [4:0]carry;
wire [3:0]carry_generator;
wire [3:0]carry_propagation;
full_adder dut0(.a(a[0]),.b(b[0]),.c(carry[0]),.sum(sum[0]),.carry());
full_adder dut1(.a(a[1]),.b(b[1]),.c(carry[1]),.sum(sum[1]),.carry());
full_adder dut2(.a(a[2]),.b(b[2]),.c(carry[2]),.sum(sum[2]),.carry());
full_adder dut3(.a(a[3]),.b(b[3]),.c(carry[3]),.sum(sum[3]),.carry());


assign carry_generator[0]=a[0]*b[0];
assign carry_generator[1]=a[1]*b[1];
assign carry_generator[2]=a[2]*b[2];
assign carry_generator[3]=a[3]*b[3];

assign carry_propagation[0]=a[0] | b[0];
assign carry_propagation[1]=a[1] | b[1];
assign carry_propagation[2]=a[2] | b[2];
assign carry_propagation[3]=a[3] | b[3];

assign carry[0]=1'b0;
assign carry[1]=carry_generator[0] | (carry_propagation[0]&carry[0]);
assign carry[2]=carry_generator[1] | (carry_propagation[1]&carry[1]);
assign carry[3]=carry_generator[2] | (carry_propagation[2]&carry[2]);
assign carry[4]=carry_generator[3] | (carry_propagation[3]&carry[3]);
assign sum_output={carry[4],sum};
endmodule
module full_adder(a,b,c,carry,sum);
input a,b,c;
output carry,sum;
assign sum=a^b^c;
assign carry=(a&b)|(b&c)|(c&a);
endmodule
