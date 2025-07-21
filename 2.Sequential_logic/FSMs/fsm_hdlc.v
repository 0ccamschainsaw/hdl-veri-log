//sequence recognition
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter A = 4'h0, B = 4'h1, C = 4'h2, D = 4'h3, E = 4'h4, F = 4'h5, G = 4'h6, H = 4'h7, I = 4'h8, J = 4'h9;
    reg [3:0] state, next;
    always @(*) begin
        case(state) 
            A : next = in ? B : A;
            B : next = in ? C : A;
            C : next = in ? D : A;
            D : next = in ? E : A;
            E : next = in ? F : A;
            F : next = in ? H : G;
            G : next = in ? B : A;
            H : next = in ? J : I;
            I : next = in ? B : A;
            J : next = in ? J : A;
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
    assign err = (state == J);
    assign disc = (state == G);
    assign flag = (state == I);
endmodule
