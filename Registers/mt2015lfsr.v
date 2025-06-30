module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    reg d [2:0];
    wire clk, load;
    assign clk = KEY[0];
    assign load = KEY[1];
    always @(posedge clk) begin
        if (load) begin
            LEDR = SW;
        end
        else begin
            LEDR[0] <= LEDR[2];
            LEDR[1] <= LEDR[0];
            LEDR[2] <= LEDR[1] ^ LEDR[2];
        end
    end

endmodule
