//can't use always@(posedge clk here), state reg is given as input already
module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] next;   
    always@(*) begin
        case({y, x})
            4'b0000:    next = 3'b000;
            4'b0001:    next = 3'b001;
            4'b0010:    next = 3'b001;
            4'b0011:    next = 3'b100;
            4'b0100:    next = 3'b010;
            4'b0101:    next = 3'b001;
            4'b0110:    next = 3'b001;
            4'b0111:    next = 3'b010;
            4'b1000:    next = 3'b011;
            4'b1001:    next = 3'b100;
        endcase
    end
    assign z = (y == D ) | (y == E);
    assign Y0 = next[0];

endmodule
