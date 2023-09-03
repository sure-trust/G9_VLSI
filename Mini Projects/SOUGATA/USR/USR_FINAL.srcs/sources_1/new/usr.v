
`timescale 1ns / 1ps
module usr(
output [3:0] p_out,
output [3:0] p_out_bar,
input  [3:0] p_in ,
input  rst, clk, s_right, s_left,
input [1:0]s
);
wire [3:0]d;
wire [3:0]q;
wire [3:0]qb;
mux4x1 m1(d[0],p_in[0],s_left,q[1],q[0],s[1],s[0]);
mux4x1 m2(d[1],p_in[1],q[0],q[2],q[1],s[1],s[0]);
mux4x1 m3(d[2],p_in[2],q[1],q[3],q[2],s[1],s[0]);
mux4x1 m4(d[3],p_in[3],q[2],s_right,q[3],s[1],s[0]);

d_ff ff1(q[0],qb[0],d[0],rst,clk);
d_ff ff2(q[1],qb[1],d[1],rst,clk);
d_ff ff3(q[2],qb[2],d[2],rst,clk);
d_ff ff4(q[3],qb[3],d[3],rst,clk);

assign p_out_bar = {qb[3:0]};
assign p_out = {q[3:0]};
endmodule

module mux4x1(
output y0,
input i0,i1,i2,i3,
input s1,s0
);
wire w1,w2,a,b,c,d;

not n1(w1,s1);
not n2(w2,s0);
and a1(a,w1,w2,i0);
and a2(b,w1,s0,i1);
and a3(c,s1,w2,i2);
and a4(d,s1,s0,i3);
or o1(y0,a,b,c,d);
endmodule

module d_ff(
output reg q,qb,
input d,rst,clk
);
always@(posedge clk)
begin
if(rst) begin
q=1'b0; qb=1'b1; end
else begin
if(d==0) begin
q=1'b0; qb=1'b1; end
else if(d==1) begin
q=1'b1; qb=1'b0; end
end
end

endmodule

