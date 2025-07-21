module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter a = 2'b00, b = 2'b01, c = 2'b10, d = 2'b11;
    reg [1:0] state, next;
    always @(*) begin
        case (state) 
            a : begin
                if (r[1]) next = b;
                else if (~r[1] & r[2]) next = c;
                else if (~r[1] & ~r[2] & r[3]) next = d;
                else next = a;
            end
            b : next = r[1] ? b : a;
            c : next = r[2] ? c : a;
            d : next = r[3] ? d : a;
        endcase
    end
    always @(posedge clk) begin
        if (~resetn) begin
            state <= a;
        end
        else begin
            state <= next;
        end
    end
    assign g[1] = (state == b);
    assign g[2] = (state == c);
    assign g[3] = (state == d);

endmodule
