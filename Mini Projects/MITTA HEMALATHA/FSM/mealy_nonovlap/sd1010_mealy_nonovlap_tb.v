module sd1010_mealy_nonovlap_tb;
reg clk,reset,d;
wire q;
sd1010_mealy_nonovlap sd1(q,clk,reset,d);
initial
begin
	clk=0;
	reset=1;
	d=0;
	#15 reset=0;
	/*d=1;
	#10 d=0;;
	#10 d=1;
	#10 d=0;
	#10 d=1;*/
	#200 $finish();
end
always #5 clk=~clk;
always #10 d=~d;
endmodule
