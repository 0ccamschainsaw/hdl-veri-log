module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF INST1 (KEY[0], SW[3], KEY[2], KEY[1], KEY[3], LEDR[3]);
    MUXDFF INST2 (KEY[0], SW[2], KEY[2], KEY[1], LEDR[3], LEDR[2]);
    MUXDFF INST3 (KEY[0], SW[1], KEY[2], KEY[1], LEDR[2], LEDR[1]);
    MUXDFF INST4 (KEY[0], SW[0], KEY[2], KEY[1], LEDR[1], LEDR[0]);

endmodule

module MUXDFF (input clk, input r, input l,input e ,input w, output q);
    always @(posedge clk) begin
        q <= ( l ? r : (e ? w : q));
    end
endmodule
//4 bit shift reguster using muxdff
