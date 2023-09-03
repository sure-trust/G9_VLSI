module sd1010_moore_nonovlap_tb;
reg clk,reset,d;
wire q;
sd1010_moore_nonovlap sd1(clk,reset,d,q);
initial
begin
	clk=0;
	reset=1;
	d=0;
	#15 reset=0;
	
	#200 $finish();
end
always #5 clk=~clk;
always #10 d=~d;
endmodule
