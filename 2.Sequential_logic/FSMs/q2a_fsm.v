module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;
    reg [2:0] next, state;
    always @(*) begin
        case (state)
            A : next = w ? B : A;
            B : next = w ? C : D;
            C : next = w ? E : D;
            D : next = w ? F : A;
            E : next = w ? E : D;
            F : next = w ? C : D;
            default : next = A;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end
        else begin
            state <= next;
        end
    end
    assign z = (state == F) || (state == E);
endmodule
