`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: carry_look_adder_tb
//////////////////////////////////////////////////////////////////////////////////

module carry_look_adder_tb;
reg [3:0]a;
reg [3:0]b;
wire [4:0]result;
carry_look_adder DUT(a,b,result);
initial
begin
    a=4'b1010;
    b=4'b1010;
    #10;
    a=4'b1100;
    b=4'b1010;
    #10;
    a=4'b1001;
    b=4'b1110;
    #10;
    a=4'b1100;
    b=4'b1010;
    #10;
    $finish;   
end    
endmodule