//use count method as 3 bits are to be read at once
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 0, B = 1;
    reg state, next;
    reg [1:0] count, n1;
    always @(*) begin
        case (state) 
            A : next = s ? B : A;
            B : next = B;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            count = 0;
            n1 = 0;
        end
        else begin
            state <= next;
            if (state == B) begin
                if (count == 3) begin
                    count = 0;
                    n1 = 0;
                end
              if (w) n1 <= n1 + 1;          //No else statement, as it is happening sequentially, in the same clock cycle, 
                                            //z is computed from the latched (previous) values of count and count1.
              count = count + 1;    
                
            end
        end
    end
    assign z = ((count == 3) & (n1 == 2));
endmodule
