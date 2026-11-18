module register_unit (
    input  logic       Clk,
    input  logic       Reset,
    input  logic       LoadA,
    input  logic       LoadB,
    input  logic       Shift,
    input  logic [7:0] Din,
    input  logic       A_next,
    input  logic       B_next,
    output logic [7:0] RegA,
    output logic [7:0] RegB
);
    // Priority: Reset > Shift > Load > Hold.
    always_ff @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            RegA <= {8{1'b0}};
            RegB <= {8{1'b0}};
        end 
        else begin
            if (Shift)
                RegA <= {A_next, RegA[7:1]};
            else if (LoadA)
                RegA <= Din;

            if (Shift)
                RegB <= {B_next, RegB[7:1]};
            else if (LoadB)
                RegB <= Din;
        end
    end
endmodule
