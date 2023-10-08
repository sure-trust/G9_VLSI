module asyn_fifo(output full,empty,
						output reg [7:0]dout,
						input [7:0]din,
						input wclk,rclk,wrst,rrst,wen,ren);

reg [7:0] fifo [7:0];
reg [3:0] wp;
reg [3:0] rp;
    
always @(posedge wclk,posedge wrst)
begin
	if (wrst) 
		wp<=0;
	else 
	begin
		if (wen && !full)
		begin
			fifo[wp]<=din;
			wp<=wp+1;
      end
   end
end

always @(posedge rclk,posedge rrst) 
begin
	if (rrst) 
	begin
		rp<=0;
		dout<=0;
   end 
	else 
	begin
		if (ren && !empty) 
		begin
			dout<=fifo[rp];
			rp<=rp+1;
      end
	 end
end

assign full=((wp-rp)==8);
assign empty=((wp-rp)==0);

endmodule
