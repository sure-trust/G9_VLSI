`timescale 1ns / 1ps
module mux8_1(out, D, S); 
output out; 
input [7:0]D;
input[2:0]S; 
wire [2:0]sbar; 
wire [7:0]T;

not u1(sbar[0], S[0]);
not u2(sbar[1], S[1]);
not u3(sbar[2], S[2]);

and u4(T[0], D[0], sbar[0], sbar[1], sbar[2]);
and u5(T[1], D[1], S[0], sbar[1], sbar[2]);
and u6(T[2], D[2], sbar[0], S[1], sbar[2]);
and u7(T[3], D[3], S[0], S[1], sbar[2]);
and u8(T[4], D[4], sbar[0], sbar[1], S[2]);
and u9(T[5], D[5], S[0], sbar[1], S[2]);
and u10(T[6], D[6], sbar[0], S[1], S[2]);
and u11(T[7], D[7], S[0], S[1], S[2]);
or u12(out, T[0],T[1], T[2], T[3], T[4], T[5], T[6], T[7]);
endmodule
