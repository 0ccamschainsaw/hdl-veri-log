//Nested 'always' is not allowed
module top_module (
    input clock,
    input a,
    output p,
    output q );
    wire x;
    always @(negedge clock) begin
        q <= p;
    end
    always @(*) begin
    	if (clock) begin
        	p = a;
    	end
        else begin
            p = p;
        end
    end
endmodule
