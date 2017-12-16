
// State Machine

module Game_Logic(clock, present_state, start_button, user_bits, score, y_pos1, y_pos2, y_pos3,letter1, letter2, letter3);

    input start_button;
    input user_bits;

    output [7:0] score;
    output [4:0] y_pos1;
    output [4:0] y_pos2;
    output [4:0] y_pos3;
    output [7:0] letter1;
    output [7:0] letter2;
    output [7:0] letter3;

    output reg [2:0] present_state;
    reg [2:0] next_state;

    // Calculate next state


    // Calculate outputs

endmodule


