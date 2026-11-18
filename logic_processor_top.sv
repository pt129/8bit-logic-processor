module logic_processor_top (
    input  logic       Clk,
    input  logic       Reset,
    input  logic       LoadA,
    input  logic       LoadB,
    input  logic       Execute,
    input  logic [7:0] Din,
    input  logic [2:0] F,
    input  logic [1:0] R,
    output logic [7:0] Aval,
    output logic [7:0] Bval
);
    logic Shift, A, B, Result, A_next, B_next, Ao, Bo;

    assign A = Aval[0];
    assign B = Bval[0];
    //Unit 1: control unit
    control_unit control_inst (
        .Clk(Clk), .Reset(Reset), .Execute(Execute),
        .Shift(Shift)
    );
    //Unit 2: register unit
    register_unit register_inst (
        .Clk(Clk), .Reset(Reset),
        .LoadA(LoadA), .LoadB(LoadB), .Shift(Shift),
        .Din(Din), .A_next(A_next), .B_next(B_next),
        .RegA(Aval), .RegB(Bval)
    );
    //Unit 3: computation unit
    computation_unit computation_inst (
        .A(A), .B(B), .F(F), .Result(Result), .Ao(Ao), .Bo(Bo)
    );
    //Unit 4: routing unit
    routing_unit routing_inst (
        .A(Ao), .B(Bo), .Result(Result), .R(R),
        .A_next(A_next), .B_next(B_next)
    );

    
endmodule
