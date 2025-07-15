module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter idle = 3'b000, start = 3'b001, data = 3'b010, waits = 3'b011, stop = 3'b100;
    reg [2:0] state, next_state;
    reg [3:0] i;
    always @(*) begin
        case (state) 
            idle : next_state = in ? idle : start;
            start : next_state = data;
            data : begin
                if (i == 3'h8) begin
                	next_state = in ? stop : waits;
            	end
            	else begin
                	next_state = data;
            	end
            end
            waits : next_state = in ? idle : waits;
            stop : next_state = in ? idle : start;
        endcase
    end	
    always @(posedge clk) begin
        if (reset) begin
            state <= idle;
        end
        else begin
            state <= next_state;
        end
    end
    always @(posedge clk) begin
        if (reset) begin 
            done <= 0;
            i <= 0;
        end
        else begin
            case (next_state) 
                data : begin
                    done <= 1'b0;
                    i = i + 1'b1;
                end
                stop : begin
                    done <= 1'b1;
                    i <= 0;
                end
                default: begin
                    done <= 0;
                    i <= 0;
                end
            endcase
        end
    end
endmodule
