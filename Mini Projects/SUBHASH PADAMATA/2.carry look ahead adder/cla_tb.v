`timescale 1ns / 1ps

module cla_tb;

  reg [3:0] input1, input2;
  wire [4:0] output_sum;

  // Instantiate the cla module
  cla dut(input1, input2, output_sum);

  initial begin
    $monitor("input1=%b input2=%b output_sum=%b", input1, input2, output_sum);
    #1000 $finish;
  end

  always begin
    input1 = $random;
    input2 = $random;
    #100;
  end

endmodule
