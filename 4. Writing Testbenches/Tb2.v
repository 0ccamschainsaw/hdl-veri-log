module top_module();
    reg in, clk;
    reg [2:0] s;
    wire out;
    initial begin
        s = 3'h2;
        in = 0;
        clk = 0;
        #10;
        s = 3'h6;
        #10;
        in = 1;
        s = 3'h2;
        #10;
        in = 0;
        s = 3'h7;
        #10;
        in = 1;
        s = 3'h0;
        #30
        in = 0;
    end
    always begin
        #5 clk = ~clk;
    end
    q7 u_q7(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out)
    );
endmodule
