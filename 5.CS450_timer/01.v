module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] counter;
    always @(posedge clk) begin
        if (load) begin
            if (data == 0) begin
                counter <= 0;
                tc <= 1;
            end
            else begin
            	counter <= data;
            	tc <= 0;
            end
        end
        else begin
            if (counter != 0) begin
                counter <= counter - 1;
                tc <= (counter == 1);   //tc is high when next count reaches zero
            end
            else begin
                tc <= 1;
            end
        end
    end

endmodule
