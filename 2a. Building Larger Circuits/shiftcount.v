module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    always @(posedge clk) begin
        if(shift_ena) begin
            if(data) begin
                q[1] <= q[0];
                q[2] <= q[1];
                q[3] <= q[2];
                q[0] <= data;
            end
            else begin
                q[1] <= q[0];
                q[2] <= q[1];
                q[3] <= q[2];
                q[0] <= 0;
            end
        end
        else if (count_ena) begin
            q <= q - 3'b001;
        end
    end
endmodule
