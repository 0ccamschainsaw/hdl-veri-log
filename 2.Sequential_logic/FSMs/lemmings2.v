module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter left = 2'b00, left_fall = 2'b01, right_fall = 2'b10, right = 2'b11;
    reg [1:0] state, next_state;
    always @(*) begin
        // State transition logic
        case (state) 
            left : next_state = ground ? ( bump_left ? right : left) : left_fall;
            right : next_state = ground ? (bump_right ? left : right) : right_fall;
            left_fall : next_state = ground ? left : left_fall;
            right_fall : next_state = ground ? right : right_fall;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) begin
            state <= left;
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
            assign walk_left = (state == left);
            assign walk_right = (state == right);
    		assign aaah = (state == left_fall) || (state == right_fall); 

endmodule
