module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter a = 4'h0, b = 4'h1, c = 4'h2,d = 4'h3, e = 4'h4, fs = 4'h5, gs = 4'h6, h = 4'h7, b0 = 4'h8;
    reg [3:0] state, next;
    always @(*) begin
        case (state)
            a : next = (~resetn) ? a : b0;
            b0 : next = b;                       //state in bw for f output
            b : next = x ? c : b;
            c : next = x ? c : d;
            d : next = x ? e : b;
            e : next = y ? fs : gs;
            fs : next = (~resetn) ? a : fs;
            gs : next = y ? fs : h;
            h : next = (~resetn) ? a : h;
        endcase
    end
    always @(posedge clk) begin
        if (~resetn) begin
            state <= a;
        end
        else begin
            state <= next;
        end
    end
    always @(posedge clk) begin
        case(next) 
            b0 : f <= 1;
            e : g <= 1;
            fs : g <= 1;
            h : g <= 0;
            gs : g <= 1;
            default: begin
                g <= 0;
                f <= 0;
            end
        endcase
    end
endmodule
