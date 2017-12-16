module Display_Test (CLOCK_50, SW, VGA_R, VGA_G, VGA_HS, VGA_VS);
    input CLOCK_50;
    input [9:0] SW;
    output [3:0] VGA_R, VGA_G;
    output VGA_HS, VGA_VS;

    wire [1199:0] framebuffer;

    Display display (
        .clock(CLOCK_50),
        .letter1(SW[7:0]),
        .letter2(SW[7:0] + 8'd1),
        .letter3(SW[7:0] + 8'd2),
        .ypos1(0),
        .ypos2(10),
        .ypos3(21),
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

