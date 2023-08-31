`timescale 1ns / 1ps
module ram_tb();
parameter addr_width = 6;
parameter data_width = 8;
parameter depth = 32;

wire [data_width-1:0] q;
reg [data_width-1:0] data;  
reg [addr_width-1:0] address;  
reg we,clk;

single_port_ram dut(q,data,address,we,clk);
initial
begin
clk=0;
we=1;
data='he2;
address='d0;
#20 
data='hcd;
address='d1;
#20
data='h7f;
address='d2;
#20
data='h9d;
address='d3;
#20 
data='hz;
address='d0;
#20 address='d1;
#20 address='d2;
#20 address='d3;
$monitor("write enable: %b  address: %b  data: %b  output: %b", we, address, data, q);
#40 $finish();
end
always #10 clk=~clk;
always #80 we=~we;
endmodule



/*
data= 8'hf0;
address= 6'd0;      
we= 1'b1;        //write data
#10;

data= 8'he1;
address= 6'd1;      
#10;

data= 8'hd2;
address= 6'd2;      
#10;
data= 8'hz; 
 //read operation
address= 5'd0;      
we= 1'b0;       
#10;

address= 5'd2;     
#10;

address= 5'd1;
#10;*/