module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else begin
            case (ena)
                2'b01 : q <= {q[0], q[99:1]};
                2'b10 : q <= {q[98:0], q[99]};
                default : q <= q;     //q doesn't change
            endcase
        end
    end
endmodule
