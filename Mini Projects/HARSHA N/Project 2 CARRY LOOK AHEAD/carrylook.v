`timescale 1ns / 1ps
module carrylook(input [3:0]p,q, input r,output [3:0]sum,output carry);
  wire m0,m1,m2,m3,n0,n1,n2,n3,l0,l1,l2,l3; 
 assign m0=p[0]^q[0],
        m1=p[1]^q[1],
        m2=p[2]^q[2],
        m3=p[3]^q[3];
 
 assign n0=p[0]&q[0],
        n1=p[1]&q[1],
        n2=p[2]&p[2],
       n3=p[3]&p[3];
 
 assign l0=n0|(m0 & r),
        l1=n1|(m1 & n0) | (m1 & m0 &r),
        l2=n2|(m2 & n1) | (m2 & m1 & n0)| (m2 & m1 & m0 & r),
        l3=n3| (m3 & n2) | (m3 & m2 &l1) | (m3 & m2 & m1 & n0) | (m3 & m2 & m1 & m0 & r);
 assign sum[0]=m0^r,
        sum[1]=m1^l0,
        sum[2]=m2^l1,
        sum[3]=m3^l2,
        carry=l3;
endmodule
         
   
   
        