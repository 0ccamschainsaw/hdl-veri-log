module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial A = 0;
    initial B = 0;
    initial begin
        #10 A = ~A;
        #5 B = ~B;
        #5 A = ~A;
        #20 B = ~B;
    end
endmodule
