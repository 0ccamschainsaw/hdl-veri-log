module top_module();
    reg [1:0] in;
    wire out;
    initial in[0] = 0;
    initial in[1] = 0;
    initial begin
        #10 in[0] = ~in[0];
        #10 begin 
            in[1] = ~in[1];
        	in[0] = ~in[0];
        end
        #10 in[0] = ~in[0];
    end
    andgate u_andgate(
        .in(in),
        .out(out)
    );
endmodule
