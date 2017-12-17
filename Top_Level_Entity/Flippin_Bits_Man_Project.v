
module Flippy_Bit (CLOCK_50, SW, LEDG, BUTTON, HEX0, HEX1, HEX2, HEX3); 
    input CLOCK_50;
    input [7:0] SW;
    input [2:0] BUTTON;
    output [6:0] HEX0, HEX1, HEX2, HEX3;
    
    wire [2:0]    state, next_state, game_over, correct;
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
    
    wire [3:0] red_out, green_out, blue_out; //From VGA; Change Accordingly!
    wire h_sync_out, v_sync_out, out; //From VGA; Change Accordingly!

    wire clock_some_hertz; //Change when hertz value is decided
    wire reset_button, reset_signal; 
    
    assign HEX2_DP = 1'b0;
    assign reset_button = BUTTON[2];
    
    ClockDivider_Flippy_Bit u1 (CLOCK_50, clock_some_hertz);
    
    Big_State_Machine u (reset_button, game_over, correct, reset_signal, score, clock_some_hertz);
    
    Column inst (clock, user_input, reset_signal, ypos, game_over, correct, letter); // change as needed
    
    assign LEDG = {tens, ones};
    assign HEX0 = ~seven_seg_hex0;
    assign HEX1 = ~seven_seg_hex1;
    assign HEX2 = ~ones_hex2;
    assign HEX3 = ~tens_hex3;
    assign HEX2_DP = 1'b0;

    Seven_Seg hex0  (SW [3:0], seven_seg_hex0);
    Seven_Seg hex1  (SW [7:4], seven_seg_hex1); 
    Seven_Seg hex2  (ones, ones_hex2);
    Seven_Seg hex3  (tens, tens_hex3);
    Binary_BCD one_hex2 (SW [7:0], ones, tens, hundreds);
    
    Display u (clock_some_hertz, letter1, letter2, letter3, ypos1, ypos2, ypos3, framebuffer);
    
    VGA u (clock_some_hertz, framebuffer, );
    
endmodule
    