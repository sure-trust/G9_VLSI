`timescale 1ns / 1ps

module ripplecarryadd(input a,b,cin, output sum,carry );
assign sum = a^b^cin;
assign carry = (a&b)|(b&cin)|(a&cin);
endmodule
module ripple(input [3:0]a,b,output [3:0]sum, output c4);
wire c1,c2,c3;
ripplecarryadd r1(a[0],b[0],cin, sum[0],c1 );
ripplecarryadd r2(a[1],b[2],c1, sum[1],c2 );
ripplecarryadd r3(a[2],b[2],c2, sum[2],c3 );
ripplecarryadd r4(a[3],b[3],c3, sum[3],c4 );
endmodule
