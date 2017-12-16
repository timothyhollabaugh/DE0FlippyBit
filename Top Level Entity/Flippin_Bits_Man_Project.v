module Flippy_Bit (CLOCK_50, SW, BUTTON, HEX0, HEX1, HEX2, HEX3, HEX2_DP); 
    input CLOCK_50;
    input [7:0]SW;
    input [2]BUTTON;
    output [6:0] HEX0, HEX1, HEX2, HEX3;
    output HEX2_DP;
    
    wire [2:0]state, next_state, game_over, correct;
    wire [1199:0]framebuffer;
    wire [4:0]ypos1, ypos2, ypos3;
    wire [7:0]score, letter1, letter2, letter3;
    
    wire [3:0] in; //From Seven_Seg; Change accordingly!
	wire [6:0] out; //From Seven_Seg; Change accordingly!
    wire [7:0] binary; //From Binary_BCD; Change Accordingly!
    wire [3:0] ones, tens; //From Binary_BCD; Change Accordingly!
    wire [1:0] hundreds; //From Binary_BCD; Change Accordingly!
    wire [3:0] red_out, green_out, blue_out; //From VGA; Change Accordingly!
    wire h_sync_out, v_sync_out, out; //From VGA; Change Accordingly!

    wire clock_some_hertz; //Change when hertz value is decided
    wire reset_button, reset_signal; 
    
    assign HEX2_DP = 0;
    assign reset_button = BUTTON[2];
    
    
    ClockDivider_Flippy_Bit u1 (CLOCK_50, clock_some_hertz);
    
    Big_State_Machine u (reset_button, game_over, correct, reset_signal, score, clock_some_hertz);
    
    Column_State_Machine u (reset_signal, game_over, correct, letter1, ypos1); // Change as needed
    Column_State_Machine u (reset_signal, game_over, correct, letter2, ypos2); // Change as needed
    Column_State_Machine u (reset_signal, game_over, correct, letter3, ypos3); // Change as needed
    
    Binary_BCD u (binary, ones, tens, hundreds); // Change as needed
    Binary_BCD u (binary, ones, tens, hundreds); // Change as needed
    Binary_BCD u (binary, ones, tens, hundreds); // Change as needed
    
    Seven_Seg u (in, HEX0); //Change "in" as needed
    Seven_Seg u (in, HEX1); //Change "in" as needed
    Seven_Seg u (in, HEX2); //Change "in" as needed
    Seven_Seg u (in, HEX3); //Change "in" as needed
    
    Display u (clock_some_hertz, letter1, letter2, letter3, ypos1, ypos2, ypos3, framebuffer);
    
    VGA u (clock_some_hertz, framebuffer, );
    
endmodule
    