`timescale 1ns / 1ps
//////////////////////////////////////////
module ram( input clk,
    input wr,
    input  [2:0] addr,
    input  [7:0] wr_data,//data in
    output [7:0] rd_data//data out
    );
	 reg [0:7] mem [0:3];

    always @(posedge clk) begin
        if (wr)
            mem[addr] <= wr_data;//the data stored in the addr location
				
    end
	assign rd_data=mem[addr];

   

endmodule



