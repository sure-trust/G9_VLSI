`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 23:22:53
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo(clk,Data_in,Data_out,rst,wr_en,rd_en,full,empty);
parameter width = 8; 
parameter depth = 16;
 parameter addr_width = 4;

input clk,rd_en,wr_en,rst; 
input [width-1:0]Data_in;
output reg[width-1:0]Data_out;
output full,empty;

reg [addr_width-1:0]wr_ptr;
reg [addr_width-1:0]rd_ptr;
reg [addr_width:0]status_count;
reg [width-1:0] MEM [depth-1:0];
assign full = (status_count == depth)?1:0;
assign empty = (status_count == 0)?1:0; 
integer i;

//write ponter
always @(posedge clk)
 begin
if(rst)
wr_ptr<=0;
else 
if(wr_en)
wr_ptr<=wr_ptr+1;
 end

//read ponter 
always@(posedge clk) begin
if(rst)
rd_ptr<=0;
else if(rd_en)
rd_ptr<=rd_ptr+1;
 end

//status count
always @(posedge clk) 
begin
if(rst)
status_count<=0;
 
else if((wr_en && !full)&&(!rd_en)) status_count<=status_count+1;
else if((rd_en && !empty)&&(!wr_en)) status_count<=status_count-1;
else if((wr_en && !full)&&(rd_en && !empty)) status_count<=status_count;
 end
always@(posedge clk) begin
 if(rst)
begin
 for(i=0; i<depth; i=i+1)
begin
 MEM[i]<=0;
 end
 end
 else
 begin
 if(wr_en)
MEM[i]<=0;
 MEM[wr_ptr]<=Data_in; 
if(rd_en)
Data_out<=MEM[rd_ptr];

end
end
endmodule