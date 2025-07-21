// Mealy 101, overlap sequence detector
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
    reg [1:0] state, next;
    always @(*) begin
        case (state) 
            A : next = x ? B : A;
            B : next = x ? B : C;
            C : next = x ? B : A;
        endcase
    end
    always @(posedge clk or negedge aresetn) begin
        if (~aresetn) begin
            state <= A;
        end
        else begin
            state <= next;
        end
    end
    assign z = (next == B) & (state == C);
endmodule
