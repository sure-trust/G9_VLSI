module top_tb(
    );
	reg i_Txstart;
	reg i_clk;
	reg i_reset;
	reg [7:0]i_txdatain;
	wire [7:0]o_rxdataout;

	top_module uart1(
		.i_Txstart(i_Txstart), 
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_txdatain(i_txdatain), 
		.o_rxdataout(o_rxdataout)
	);
	
    task resett();
	 begin
	     @(negedge i_clk)
				i_reset = 0;
	     @(negedge i_clk)
             i_reset = 1;  	 
	 end
    endtask
	
	always
begin
i_clk=0;
#50;
i_clk=1;
#50;
end				  
	initial  
        begin    
			resett;
			 i_Txstart=1;
			#100 i_txdatain=8'b10110101; 
			#10000 i_Txstart = 0;
		   
	       #1000 i_Txstart=1; 
			 #100 i_txdatain=8'b10101001; 
			 #10000 i_Txstart=0;
			#10000 i_Txstart=1;
			 #100 i_txdatain=8'b11110000;
			 #10000 i_Txstart=0;
			 #15000 i_Txstart=1;
			 #100 i_txdatain=8'b00110011;
			 #10000 i_Txstart=0;	   		     
	    end
endmodule
