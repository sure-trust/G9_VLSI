`timescale 1ns / 1ps
module look_ahead_adder(a,b,cin,sum,cout );
output [3:0]sum;output cout;
input [3:0]a,b;input cin;
wire p1,p2,p3,p4,g1,g2,g3,g4;
wire c1,c2,c3,c4;
assign  p1=a[0]^b[0];
assign  p2=a[1]^b[1];
assign  p3=a[2]^b[2];
assign  p4=a[3]^b[3];
assign  g1=a[0]&b[0];
assign  g2=a[1]&b[1];
assign  g3=a[2]&b[2];
assign  g4=a[3]&b[3];
assign c1 =g1|(p1&cin);
assign c2 =g2|(p2&g1)|(p2&p1&cin);
assign c3 =g3|(p3&g2)|(p3&p2&g1)|(p2&p1&p3&cin);
assign c4=g4|(p4&g3)|(p3&p4&g2)|(p3&p2&p4&g1)|(p4&p3&p2&p1&cin);
assign sum[0]=p1^cin;
assign sum[1]=p2^c1;
assign sum[2]=p3^c2;
assign sum[3]=p4^c3;
assign cout =c4; 
endmodule
