`timescale 1ns / 1ps

module twistedring(clk,rst,counter);
input clk,rst; output [3:0]counter;reg [3:0]count;
always@(*) begin
if(rst==1)begin 
count =4'b0000;
end
else if(clk) begin 
count[3]=count[2];
count[2]=count[1];
count[1]=count[0];
count[0]=(~count[3]);
end
end           
assign counter = count;
endmodule
/*clk,rst,counter );
input clk,rst; output[3:0]counter;reg [3:0]count;
always@(posedge clk) begin
if(rst==1)
count <= 4'b0000;
else  begin
count [3]= count[2];
count [2]= count[1];
count [1]= count[0];
count [0]= ~count[3];end
end
assign counter = count;
endmodule*/
