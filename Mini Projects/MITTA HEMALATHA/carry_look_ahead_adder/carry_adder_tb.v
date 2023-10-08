module carry_adder_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] s;
wire cout;

carry_look_ahead_adder add(s,cout,a,b,cin);
initial 
begin
	a = 0;
	b = 0;
	cin = 0;
	#160 $finish();
	end
always #5 a=$random();
always #10 b=$random();      
endmodule
