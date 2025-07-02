module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            q <= 4'b0;
        end
        else begin
            if (load) begin
                q[0] <= data[0];
                q[1] <= data[1];
                q[2] <= data[2];
                q[3] <= data[3];
            end
            else begin
                if (ena) begin
                    q[3:0] <= {1'b0, q[3:1]};
                end
            end
        end
    end
                

endmodule
//ena: Shift right (q[3] becomes zero, q[0] is shifted out and disappears).
