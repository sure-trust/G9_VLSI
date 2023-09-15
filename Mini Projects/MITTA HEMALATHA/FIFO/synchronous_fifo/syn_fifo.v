module syn_fifo(
    output full,empty,
	 input clk,reset,wen,ren,
	 input [7:0]din,
	 output reg [7:0]dout);
	 
reg [3:0]wp,rp;
reg [7:0] fifo [7:0];
always @(posedge clk)
begin
	if(reset)
	begin
		wp<=0;
		rp<=0;
		dout<=0;
	end
	else if(wen && (!full))
	begin
		fifo[wp]<=din;
		wp<=wp+1;
	end
	else if(ren && (!empty))
	begin
		dout<=fifo[rp];
		rp<=rp+1;
	end
end
assign full=((wp-rp)==8);
assign empty=((wp-rp)==0);
endmodule
