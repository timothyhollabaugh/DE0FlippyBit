module Big_State_Machine (reset_button, game_over, correct, reset_signal, score, clock, state);
    input reset_button;
    input [2:0] game_over;
    input [2:0] correct;
    input clock;

    output reset_signal;
    output [7:0] score;
    output reg [1:0] state;

    assign reset_signal = game_over[0];

    /*
    parameter RESET = 2'b00
    parameter RUNNING = 2'b01;
    parameter CORRECT = 2'b10;

    output reg [1:0] state;
    reg [1:0] next_state;

    always @ (state or reset_signal or game_over or correct or reset_signal) begin
        case (state)
            RESET: begin
                next_state <= RUNNING;
            end

            running: begin
                next_state <= RUNNING;
            end
            */




endmodule 
