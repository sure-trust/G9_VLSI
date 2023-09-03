`timescale 1ns / 1ps

module alu (input [31:0]a,input [31:0]b,input [2:0]fun,output [31:0]y);
reg [31:0]y;
always@(*)
begin
if(fun==3'b000)
y=a&b; 
else if (fun==3'b001)
y=a|b; 
else if (fun==3'b010)
y=a%b; 
else if (fun==3'b011)
y=a+b; 
else if (fun==3'b100)
y=a-b; 
else if (fun==3'b101)
y=a*b;
else if (fun==3'b110)
y=~a;
else if(fun==3'b111)
y=a^b;
else
y=32'bz;
end
endmodule