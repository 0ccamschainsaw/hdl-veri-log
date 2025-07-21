//Output each input bit unchanged until you see the first '1' (including it).
//After the first '1', invert (flip) every following input bit before outputting.
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=2'b00, B=2'b01, C=2'b10;
    reg [1:0] state, next;
    always @(*) begin
        case (state)
            A : next = x ? B : A;
            B : next = x ? C : B;
            C : next = x ? C : B;
            default: next = A;
        endcase
    end
    always @(posedge clk or posedge areset) begin
            if (areset) begin
                state <= A;
            end
            else begin
                state <= next;
            end
        end
        
        assign z = (state == B);

endmodule
