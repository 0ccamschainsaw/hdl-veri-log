module top_module (
    input clk,
    input reset,
    output [9:0] q);
    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end
        else begin
            if (q < 999) q <= q + 1;      //999 not the same as 9'd999 (can also use 'd999)
            else q <= 0;
        end
    end
endmodule
