
module Column_Test(CLOCK_50, SW, LEDG, BUTTON, VGA_R, VGA_G, VGA_HS, VGA_VS);
    input CLOCK_50;
    input [9:0] SW;
    input [2:0] BUTTON;
    output [3:0] VGA_R, VGA_G;
    output [9:0] LEDG;
    output VGA_HS, VGA_VS;

    wire [1199:0] framebuffer;
    wire [4:0] ypos_wire;
    wire [7:0] letter_wire;

    assign LEDG[5:1] = ypos_wire;

    Column columntwo(
        .clock(CLOCK_50),
        .user_input(SW[7:0]),
        .reset_signal(~BUTTON[0]),
        .ypos(ypos_wire),
        .game_over(LEDG[9]),
        .correct(LEDG[0]),
        .letter(letter_wire),
    );

    Display display (
        .clock(CLOCK_50),
        .letter1(SW[7:0]),
        .letter2(letter_wire),
        .letter3(SW[7:0] + 8'd2),
        .ypos1(10),
        .ypos2(ypos_wire),
        .ypos3(22),
        .framebuffer(framebuffer)
    );

    VGA vga (
        .clk(CLOCK_50),
        .data(framebuffer),
        .red_out(VGA_R),
        .green_out(VGA_G),
        .h_sync_out(VGA_HS),
        .v_sync_out(VGA_VS),
    );

endmodule
