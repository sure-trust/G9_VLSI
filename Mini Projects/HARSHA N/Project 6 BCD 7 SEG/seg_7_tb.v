`timescale 1ns / 1ps
module seg_7_tb();
reg a,b,c,en;
wire [6:0]seg;
seg_7 s1(a,b,c,en,seg);
initial
begin
en=0;
#10;
en=1;
#10;
a=0;b=0;c=0;#10;
a=0;b=0;c=1;#10;
a=0;b=1;c=0;#10;
a=0;b=1;c=1;#10;
a=1;b=0;c=0;#10;
a=1;b=0;c=1;#10;
a=1;b=1;c=0;#10;
a=1;b=1;c=1;#10;
$finish;
end
endmodule
