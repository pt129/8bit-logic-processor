module routing_unit (
    input  logic       A,
    input  logic       B,
    input  logic       Result,
    input  logic [1:0] R,
    output logic       A_next,
    output logic       B_next
);
    always_comb begin
        case (R)
            2'b00: begin A_next = A;      B_next = B;      end
            2'b01: begin A_next = A;      B_next = Result; end
            2'b10: begin A_next = Result; B_next = B;      end
            2'b11: begin A_next = B;      B_next = A;      end
            default: begin A_next = A; B_next = B; end
        endcase
    end
endmodule
