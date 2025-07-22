module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    parameter a = 4'h1, b = 4'h2, c = 4'h3, d = 4'h4, e = 4'h5, f = 4'h6, g = 4'h7, h = 4'h8, counts = 4'h9, dones = 4'h10;
    reg [3:0] state, next;
    reg [9:0] count1000;
    always @(*) begin
        case(state) 
            a : next = data ? b : a;
            b : next = data ? c : a;
            c : next = data ? c : d;
            d : next = data ? e : a;
            e : next = f;
            f : next = g;
            g : next = h;
            h : next = counts;
            counts : next = (count==0 & count1000 == 999) ? dones : counts;
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
    always @(posedge clk) begin
        case(state)
        e : count[3] <= data;
        f : count[2] <= data;
        g : count[1] <= data;
        h : count[0] <= data;
        counts : 
        begin
            if(count >= 0) begin
                if(count1000 < 999) begin
                    count1000 <= count1000 + 1;
                end
            	else begin
                    count <= count - 1;
                    count1000 <= 0;
                end
            end
        end
        default: count1000 <= 0;
        endcase
    end
    assign done = (state == dones);
    assign counting = (state == counts);
endmodule
