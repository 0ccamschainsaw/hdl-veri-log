//next state logic, using 3 flip flops
module top_module (
    input [3:1] y,
    input w,
    output Y2);
    reg [3:1] n;
    always @(*) begin
        case({y,w}) 
            4'b0000 : n = 3'b001;
            4'b0001 : n = 3'b000;
            4'b0010 : n = 3'b010;
            4'b0011 : n = 3'b011;
            4'b0100 : n = 3'b100;
            4'b0101 : n = 3'b011;
            4'b0110 : n = 3'b101;
            4'b0111 : n = 3'b000;
            4'b1000 : n = 3'b100;
            4'b1001 : n = 3'b011;
            4'b1010 : n = 3'b010;
            4'b1011 : n = 3'b011;
        endcase
    end
    assign Y2 = n[2];
endmodule
