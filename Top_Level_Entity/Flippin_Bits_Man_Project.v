
module Flippy_Bit (CLOCK_50, SW, LEDG, BUTTON, HEX0, HEX1, HEX2, HEX3, VGA_R, VGA_G, VGA_HS, VGA_VS); 
    input CLOCK_50;
    input [7:0] SW;
    input [2:0] BUTTON;
    output [6:0] HEX0, HEX1, HEX2, HEX3;

    wire [2:0]    game_over, correct;
    wire [1199:0] framebuffer;
    wire [4:0]    ypos1, ypos2, ypos3;
    wire [7:0]    score, letter1, letter2, letter3;

    wire [6:0] seven_seg_hex0;
    wire [6:0] seven_seg_hex1;
    wire [6:0] ones_hex2;
    wire [6:0] tens_hex3;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;

    wire reset_signal;

    assign HEX2_DP = 1'b0;
    assign reset_button = BUTTON[2];

    Big_State_Machine big_state_machine (
        .reset_button(~BUTTON[2]),
        .game_over(game_over),
        .correct(correct),
        .reset_signal(reset_signal),
        .score(score),
        .clock(CLOCK_50)
    );

    Column column1 (
        .clock(CLOCK_50),
        .user_input(SW[7:0],
        .reset_signal(reset_signal),
        .ypos(ypos1),
        .game_over(game_over[0],
        .correct(correct[0],
        .letter(letter1)
    );

    Display display (
        .clock(CLOCK_50),
        .letter1(letter1),
        .letter2(letter2),
        .letter3(letter3),
        .ypos1(ypos1),
        .ypos2(ypos2),
        .ypos3(ypos3),
        .framebuffer(framebuffer);
    );

    VGA vga (
        .clk(CLOCK_50),
        .data(framebuffer),
        .red_out(VGA_R),
        .green_out(VGA_G),
        .h_sync_out(VGA_HS),
        .v_sync_out(VGA_VS),
    );

    assign LEDG = {tens, ones};
    assign HEX0 = ~seven_seg_hex0;
    assign HEX1 = ~seven_seg_hex1;
    assign HEX2 = ~ones_hex2;
    assign HEX3 = ~tens_hex3;

    Seven_Seg hex0  (SW [3:0], seven_seg_hex0);
    Seven_Seg hex1  (SW [7:4], seven_seg_hex1); 
    Seven_Seg hex2  (ones, ones_hex2);
    Seven_Seg hex3  (tens, tens_hex3);
    Binary_BCD one_hex2 (score, ones, tens, hundreds);


endmodule

