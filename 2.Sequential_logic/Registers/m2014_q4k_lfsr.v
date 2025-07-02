module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:1] q;
    always @(posedge clk) begin
        if (~resetn) begin
            out <= 1'b0;
            q <= 3'b0;
        end
        else begin
            q[3] <= in;
            q[2] <= q[3];
            q[1] <= q[2];
            out <= q[1];
        end
    end
endmodule
