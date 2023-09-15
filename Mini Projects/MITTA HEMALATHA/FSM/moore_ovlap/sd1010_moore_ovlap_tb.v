module sd1010_moore_ovlap_tb;
reg clk,reset,d;
wire q;
sd1010_moore_ovlap sd(clk,reset,d,q);
initial
begin
	clk=0;
	reset=1;
	d=0;
	#15 reset=0;
	/*
	d=1;
	#10 d=0;
	#10 d=1;
	#10 d=0;*/
	#200 $finish();
end
always #5 clk=~clk;
always #10 d=~d;
endmodule
