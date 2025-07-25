//saturation counter
module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always @(posedge clk or posedge areset) begin
        if(areset) begin
            state <= 2'b01;
        end
        else if (train_valid) begin
            if(train_taken) begin
                state <= state + 1;
                if (state == 2'b11) state <= 2'b11;
            end
            else begin 
                state <= state - 1;
                if (state == 2'b00) state <= 2'b00;
            end
        end
        else begin
            state <= state;
        end
    end

endmodule
