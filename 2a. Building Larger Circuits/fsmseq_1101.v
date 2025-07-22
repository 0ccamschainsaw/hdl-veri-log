module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter a = 3'b000, b = 3'b001, c = 3'b010, d = 3'b011, e = 3'b100, a0 = 3'b101;
    reg [2:0] state, next;
    always @(*) begin
        case (state)
            a0 : next = reset ? a0 : a;
            a : next = data ? b : a;
            b : next = data ? c : a;
            c : next = data ? c : d;
            d : next = data ? e : a;
            e : next = reset ? a : e;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= a;
        end
        else begin
            state <= next;
        end
    end
    assign start_shifting = (state == e);

endmodule
