module computation_unit (
    input  logic       A,
    input  logic       B,
    input  logic [2:0] F,
    output logic       Result,
    output logic       Ao,
    output logic       Bo
);
    always_comb begin 
        Ao = A; 
        Bo = B;
        
        
        case (F)
            3'b000: Result = A & B;
            3'b001: Result = A | B;
            3'b010: Result = A ^ B;
            3'b011: Result = 1'b1;
            3'b100: Result = ~(A & B);
            3'b101: Result = ~(A | B);
            3'b110: Result = ~(A ^ B);
            3'b111: Result = 1'b0;
            default: Result = 1'b0;
        endcase
    end
endmodule
