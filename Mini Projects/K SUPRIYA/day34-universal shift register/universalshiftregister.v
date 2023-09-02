module UniversalShiftRegister (
    input wire clk, reset,
    input wire shift_left, shift_right, parallel_load,
    input wire [7:0] data_in,
    output wire [7:0] data_out
);

    reg [7:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 8'b0;
        else if (parallel_load)
            shift_reg <= data_in;
        else if (shift_left)
            shift_reg <= {shift_reg[6:0], shift_reg[7]};
        else if (shift_right)
shift_reg <= {shift_reg[0], shift_reg[7:1]};
    end

    assign data_out = shift_reg;

endmodule
