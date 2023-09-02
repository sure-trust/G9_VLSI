`timescale 1ns / 1ps
module tb_ram;

	// Inputs
	reg clk;
	reg wr;
	reg [2:0] addr;
	reg [7:0] wr_data;

	// Outputs
	wire [7:0] rd_data;

	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.clk(clk), 
		.wr(wr), 
		.addr(addr), 
		.wr_data(wr_data), 
		.rd_data(rd_data)
	);
// Clock generation
    always begin
        #5 clk = ~clk;
end    

    // Test stimulus
    initial begin
        clk = 0;
        wr = 0;
        addr = 3'b000;
        wr_data = 8'b11001100;
        // Write data to memory
        #10 wr = 1;
			#10 wr = 0;
			
        // Read data from memory
        #10 addr = 3'b001;
        #10 wr_data = 8'b00000000;
        #10 wr = 1;
        #10 wr = 0;

        // Wait for memory read to complete
        #50;

        $finish;
end
	
      
endmodule

