
// State Machine

module Game_Logic(start, game_over, user_bits, letter_data, score, letter, x_pos, y_pos);
    input start;
    input game_over;
    input user_bits;
    input letter_data;

    output [7:0] score;
    output [7:0] letter;
    output [5:0] x_pos;
    output [5:0] y_pos;
endmodule


