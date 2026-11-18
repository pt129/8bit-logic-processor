module control_unit (
    input  logic Clk,
    input  logic Reset,
    input  logic Execute,
    output logic Shift
);
    logic Q;
    logic [2:0] Count;

    // First shift occurs while Q=0 and Execute=1.
    // Remaining three shifts occur at Q=1, Count=01,10,11.
    assign Shift = ((!Q) && Execute) || (Q && (Count != 3'b000));

    always_ff @(posedge Clk or posedge Reset) begin
        if (Reset) begin          //Case 1: reset
            Q     <= 1'b0;
            Count <= 3'b000;
        end 
        else if (!Q) begin        //Case 2: Q = 0, Reset = 0 meaning initial state
            if (Execute) begin
                Q     <= 1'b1;
                Count <= 3'b001;
            end
        end 
        else if (Count != 3'b000) begin  //Case 3: Q = 0, already executing/ halt
            Count <= Count + 3'b001;
        end 
        else if (!Execute) begin        //Case 4: halt(can switch to rest)
            Q <= 1'b0;
        end
    end
endmodule
