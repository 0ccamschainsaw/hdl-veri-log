module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    // State transition logic
    
    reg [1:0] state, next_state;
    parameter  A=0, B=1, C=2, D=3;
    always @(*) begin
        case (state)
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
        endcase
    end
    always @(posedge clk or posedge areset) begin  // State flip-flops with asynchronous reset
        if (areset) begin
            state <= A;
        end 
        else begin
            state <= next_state;
        end
    end
    
    assign out = (state == D);   // Output logiC
endmodule
