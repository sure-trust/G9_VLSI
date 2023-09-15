module asyn_fifo_tb;
reg [7:0] din;
reg wclk;
reg rclk;
reg wrst;
reg rrst;
reg wen;
reg ren;
wire full;
wire empty;
wire [7:0] dout;
asyn_fifo fifo1(full,empty,dout,din,wclk,rclk,wrst,rrst,wen,ren);
initial 
begin
		din = 0;
		wclk = 0;
		rclk = 0;
		wrst = 1;
		rrst = 1;
		wen = 0;
		ren = 0;
		
		#15 wrst=0;rrst=0;
		wen=1;ren=1;
		din=4'h2;
		#10 din=4'h3;
		#10 din=4'h4;
		#10 din=4'h5;
		#10 din=4'h6;
		#10 din=4'h7;
		#10 din=4'h8;
		#10 din=4'h9;
		#10 din=4'ha;
		#10 wen=0;
		#20;
		ren=0;
		#20 $finish();
end
always #5 wclk=~wclk;
always #10 rclk=~rclk;     
endmodule
