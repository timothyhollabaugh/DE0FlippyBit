module Big_State_Machine (reset_button, game_over, correct, reset_signal, score, clock, state);
    input [2:0]game_over, correct;
    input reset_button;
    input clock;
    output reg [2:0] reset_signal;
    output reg [7:0]score;

    parameter start = 3'd0;
    parameter running = 3'd1;
    parameter point1 = 3'd2;
    parameter point2 = 3'd3;
    parameter point3 = 3'd4;
	
    output reg [2:0] state;
    reg [2:0] next_state;

    reg inc_score;
    reg reset_score;
    
    always @(*) begin
		case(state) 
			default: next_state <= start;
			start: next_state <= running;
			running: begin
                if (game_over[0] | game_over[1] | game_over[2]) begin
                    next_state <= start;
                end else if (correct[0]) begin
                    next_state <= point1;
                end else if (correct[1]) begin
                    next_state <= point2;
                end else if (correct[2]) begin
                    next_state <= point3;
                end else begin
                    next_state <= running;
                end
			end
            point1: next_state <= running;
            point2: next_state <= running;
            point3: next_state <= running;
		endcase
	end 
    
    always @(posedge clock or posedge reset_button) begin
        if(reset_button) begin
            state <= start;
        end else begin
            if (inc_score) begin
                score <= score + 8'b1;
            end else if (reset_score) begin
                score <= 8'd0;
            end
            state <= next_state;
        end
	end

    always @(state or reset_signal or score) begin
		case(state)
            start: begin
                reset_signal <= 3'b111;
                inc_score <= 1'b0;
                reset_score <= 1'b1;
            end

            running: begin
                reset_signal <= 3'b000;
                inc_score <= 1'b0;
                reset_score <= 1'b0;
            end

            point1: begin
                reset_signal[0] <= 1'b1;
                inc_score <= 1'b1;
                reset_score <= 1'b0;
            end

            point2: begin
                reset_signal[1] <= 1'b1;
                inc_score <= 1'b1;
                reset_score <= 1'b0;
            end

            point3: begin
                reset_signal[2] <= 1'b1;
                inc_score <= 1'b1;
                reset_score <= 1'b0;
            end

            default: begin
                reset_signal <= 3'b000;
                inc_score <= 1'b0;
                reset_score <= 1'b0;
            end
		endcase
	end
    
endmodule 
