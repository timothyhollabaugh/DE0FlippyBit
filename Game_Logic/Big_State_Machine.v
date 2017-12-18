module Big_State_Machine (reset_button, game_over1, game_over2, game_over3, correct1, correct2, correct3, reset_signal, score, clock, state);
    input game_over1, game_over2, game_over3, correct1, correct2, correct3;
    input reset_button;
    input clock;
    output reg reset_signal;
    output reg [7:0]score;

    parameter start = 2'b00, running = 2'b01, point = 2'b10;// new_best_time = 3'b100, display_best_time = 3'b101;
	
    reg score_reset, score_increase;
    
    output reg [2:0] state;
    reg [2:0] next_state;
    
    always @(*) begin
		case(state) 
			default: next_state <= start;
			start: next_state <= reset_button ? start : running;
			running: begin
                if (game_over1 | game_over2 | game_over3) begin
                    next_state <= start;
                end else begin
                    next_state <= running;
                end
			end
            point: next_state <= running;
		endcase
	end 
    
    always @(posedge clock or posedge reset_button) begin
		if(reset_button) state <= start;
		else state <= next_state;
	end
    
    always @(state) begin
		case(state)
			start: {reset_signal, score_reset, score_increase} = 3'b110;
            running: {reset_signal, score_reset, score_increase} = 3'b000;
            point: {reset_signal, score_reset, score_increase} = 3'b001;
		endcase
	end
    
    always @(score_increase or score_reset) begin
        if(score_increase & ~score_reset) score <= score + 8'b00000001;
        else if (score_reset) score <= 8'b00000000;
    end
    
endmodule 
