`timescale 1ns / 1ps
module carry_look_ahead_adder_tb;
  reg [3:0]A,B; 
  reg Cin;
  wire [3:0]S;
  wire Cout;
  wire[4:0]add;
  carry_look_ahead_adder uut(A, B, Cin, S, Cout);
  assign add = {Cout, S};
  initial begin
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d", A, B, Cin, S, Cout, add);
    A = 1; B = 0; Cin = 0; #100;
    A = 2; B = 4; Cin = 1; #100;
    A = 4'hb; B = 4'h6; Cin = 0; #100;
    A = 5; B = 3; Cin = 1;
  end
endmodule


