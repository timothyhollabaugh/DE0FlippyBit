
// Going down state machine

module Column_State_Machine(clock, user_input, reset_signal, ypos, game_over, correct, letter);

    input reset_signal, clock;
    input [7:0] user_input;
    output reg game_over, correct;
    output reg [4:0] ypos;
    output reg [7:0] letter;

    parameter StartState = 3'b000,
              ResetState = 3'b001,
              DelayState = 3'b010,
            CorrectState = 3'b011,
         MovingDownState = 3'b100,
        BoardBottomState = 3'b101;

    reg [2:0]  present_state;
    reg [2:0]  next_state;
    reg [25:0] time_delay;
    reg [7:0]  randomletter;

    // Calculate nest state
    always @ (present_state or reset_signal or user_input) begin
        case (present_state)
            StartState: begin
                next_state <= reset_signal ? StartState : ResetState;
            end
            ResetState: begin
                if (~reset_signal) begin
                    next_state <= DelayState;
                end
                else begin
                    next_state <= StartState;
                end
            end
            DelayState: begin
                if (reset_signal) begin
                    next_state <= StartState;
                end
                else if (user_input == correct) begin
                    next_state <= CorrectState;
                end
                else if (time_delay >= 26'd50000000) begin
                    next_state <= MovingDownState;
                end
                else begin
                    next_state <= DelayState;
                end
            end
            CorrectState: begin
                if (~reset_signal) begin
                    next_state <= ResetState;
                end
                else begin
                    next_state <= StartState;
                end
            end
            MovingDownState: begin
                if (reset_signal) begin
                    next_state <= StartState;
                end
                else if (ypos >= 5'd21) begin
                    next_state <= BoardBottomState;
                end
                else begin
                    next_state <= DelayState;
                end
            end
            BoardBottomState: begin
                next_state <= StartState;
            end
        default: next_state <= StartState;
        endcase
    end

    // storage 
    always @ (posedge clock) begin
        present_state <= next_state;
        randomletter <= randomletter + 8'd1;
        if (present_state == DelayState) begin
            time_delay <= time_delay + 26'd1;
        end
    end

    // Calculate outputs
    always @ (present_state) begin
        case (present_state)
            StartState      : begin
                ypos      <= 5'd22;
                game_over <= 1'b0;
                correct   <= 1'b0;
                letter    <= letter;
            end
            ResetState      : begin
                ypos      <= 5'd0;
                game_over <= 1'b0;
                correct   <= 1'b0;
                letter    <= randomletter;
            end
            DelayState      :  begin
                ypos      <= ypos;
                game_over <= 1'b0;
                correct   <= 1'b0;
                letter    <= letter;
            end
            CorrectState    : begin
                ypos      <= ypos;
                game_over <= 1'b0;
                correct   <= 1'b1;
                letter    <= letter;
            end
            MovingDownState : begin
                ypos      <= ypos + 5'd1;
                game_over <= 1'b0;
                correct   <= 1'b0;
                letter    <= letter;
            end
            BoardBottomState: begin
                ypos      <= ypos;
                game_over <= 1'b1;
                correct   <= 1'b0;
                letter    <= letter;
            end
            default: begin
                ypos      <= 5'd22;
                game_over <= 1'b0;
                correct   <= 1'b0;
                letter    <= letter;
        end
        endcase 
    end

endmodule 
