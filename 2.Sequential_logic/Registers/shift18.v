module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else begin
            if (ena) begin
                case (amount)
                	  2'b00 : q <= {q[62:0], 1'b0};
                	  2'b01 : q <= {q[55:0], 8'b0};
                    2'b10 : q <= (q[63] ? {1'b1, q[63:1]} : {1'b0, q[63:1]});
                    2'b11 : q <= (q[63] ? {8'hff, q[63:8]} : {8'b0, q[63:8]});    //8 ones is 8'hff
            	endcase
            end
            else begin
                q <= q;   // nothing happens when both load and ena are 0
            end
        end
    end
endmodule
