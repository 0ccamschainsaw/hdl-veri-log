module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter a = 3'b000, b = 3'b001, c = 3'b010, d = 3'b011, e = 3'b100;
    reg [2:0] state, next;
    always @(*) begin
        case (state)
            a : next = reset ? b : a;
            b : next = c;
            c : next = d;
            d : next = e;
            e : next = a;
        endcase
    end
    always @(posedge clk) begin
        state <= next;   //no need to put reset logic as it is covered in states a and b.
    end
    assign shift_ena = (state == b) | (state == c) | (state == d) | (state == e);
endmodule
