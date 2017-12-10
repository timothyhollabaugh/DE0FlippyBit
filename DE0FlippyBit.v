module DE0FlippyBit(CLOCK_50, SW, VGA_R, VGA_G, VGA_HS, VGA_VS, LEDG);

    input CLOCK_50;
    input [9:0] SW;

    output [9:0] LEDG;
    output [3:0] VGA_R, VGA_G;
    output VGA_HS, VGA_VS;

    wire [1200:0] framebuffer;

    Display display (
        .clock(CLOCK_50),
        .xpos(1'b1),
        .ypos(1'b1),
        .framebuffer(framebuffer)
    );

    VGA vga (
        .clk(CLOCK_50),
        .data(framebuffer),
        .red_out(VGA_R),
        .green_out(VGA_G),
        .h_sync_out(VGA_HS),
        .v_sync_out(VGA_VS)
    );

endmodule


