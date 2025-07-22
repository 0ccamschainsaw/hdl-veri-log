module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter a = 4'h1, b = 4'h2, c = 4'h3, d = 4'h4, e = 4'h5, f = 4'h6, g = 4'h7, h = 4'h8, count = 4'h9, dones = 4'h10;
    reg [3:0] state, next;
    always @(*) begin
        case(state) 
            a : next = data ? b : a;
            b : next = data ? c : a;
            c : next = data ? c : d;
            d : next = data ? e : a;
            e : next = f;
            f : next = g;
            g : next = h;
            h : next = count;
            count : next = done_counting ? dones : count;
            dones : next = ack ? a : dones;
        endcase
    end
    always @(posedge clk) begin
        if(reset) begin
            state <= a;
        end
        else begin
            state <= next;
        end
    end
    assign shift_ena = (state == e) | (state == f) | (state == g) | (state == h);
    assign done = (state == dones);
    assign counting = (state == count);

endmodule
