module top_module ();
    reg clk, reset, t;
    wire q;
    tff u_tff(
        .clk	(clk    ),
        .reset	(reset  ),
        .t      (t      ),
        .q      (q      )
    ); 
    initial begin
        clk = 0;
        reset = 0;
        t = 0;
        #3;
        reset = 1;
        #10;
        reset = 0;
        t = 1;
        #5;
        t = 0;
    end
    always begin
        #5 clk = ~clk;
    end
endmodule
