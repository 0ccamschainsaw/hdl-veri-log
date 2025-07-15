module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
	parameter A=2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next_state;
    always @(*) begin
        case (state)
            A : next_state = in[3] ? B : A;
            B : next_state = in[3] ? C : C;
            C : next_state = in[3] ? D : D;
            D : next_state = in[3] ? B : A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
        end 
        else begin
            state <= next_state;
        end
    end
    assign done = (state == D);
        


endmodule
