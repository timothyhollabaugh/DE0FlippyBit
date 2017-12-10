module Display(clock, letter1, letter2, letter3, ypos1, ypos2, ypos3, framebuffer);
    input clock;
    input [7:0]letter1, letter2, letter3;
    input [4:0]ypos1, ypos2, ypos3;
    output reg[1199:0] framebuffer;
    
    reg [4:0]downward_spiral_1, downward_spiral_2, downward_spiral_3;

    always @(*) begin
        downward_spiral_1 <= ypos1;
        downward_spiral_2 <= ypos2;
        downward_spiral_3 <= ypos3;
    end

    wire [29:0]displayed_value1, displayed_value2, displayed_value3;

    letter_stuff u1 (letter1, letter1_left, letter1_right);
    letter_stuff u2 (letter2, letter2_left, letter2_right);
    letter_stuff u3 (letter3, letter3_left, letter3_right);

    //letter1
    assign displayed_value1[29:15] = letter1_left;
    assign displayed_value1[14:0] = letter1_right;
    
    //letter2
    assign displayed_value2[29:15] = letter2_left;
    assign displayed_value2[14:0] = letter2_right;
    
    //letter3
    assign displayed_value3[29:15] = letter3_left;
    assign displayed_value3[14:0] = letter3_right;

    //letter1
    always @(*) begin 
        framebuffer[88+downward_spiral_1*40:86+downward_spiral_1*40] = displayed_value1[29:27];
        framebuffer[128+downward_spiral_1*40:126+downward_spiral_1*40] = displayed_value1[26:24];
        framebuffer[168+downward_spiral_1*40:166+downward_spiral_1*40] = displayed_value1[23:21];
        framebuffer[208+downward_spiral_1*40:206+downward_spiral_1*40] = displayed_value1[20:18];
        framebuffer[248+downward_spiral_1*40:246+downward_spiral_1*40] = displayed_value1[17:15];

        framebuffer[93+downward_spiral_1*40:91+downward_spiral_1*40] = displayed_value1[14:12];
        framebuffer[133+downward_spiral_1*40:131+downward_spiral_1*40] = displayed_value1[11:9];
        framebuffer[173+downward_spiral_1*40:171+downward_spiral_1*40] = displayed_value1[8:6];
        framebuffer[213+downward_spiral_1*40:211+downward_spiral_1*40] = displayed_value1[5:3];
        framebuffer[253+downward_spiral_1*40:251+downward_spiral_1*40] = displayed_value1[2:0];
    end
    
    //letter2
    assign framebuffer[98+ypos2*40:96+ypos2*40] = displayed_value2[29:27];
    assign framebuffer[138+ypos2*40:136+ypos2*40] = displayed_value2[26:24];
    assign framebuffer[178+ypos2*40:176+ypos2*40] = displayed_value2[23:21];
    assign framebuffer[218+ypos2*40:216+ypos2*40] = displayed_value2[20:18];
    assign framebuffer[258+ypos2*40:256+ypos2*40] = displayed_value2[17:15];

    assign framebuffer[103+ypos2*40:101+ypos2*40] = displayed_value2[14:12];
    assign framebuffer[143+ypos2*40:141+ypos2*40] = displayed_value2[11:9];
    assign framebuffer[183+ypos2*40:181+ypos2*40] = displayed_value2[8:6];
    assign framebuffer[223+ypos2*40:221+ypos2*40] = displayed_value2[5:3];
    assign framebuffer[263+ypos2*40:261+ypos2*40] = displayed_value2[2:0];
    
    //letter3
    assign framebuffer[108+ypos3*40:106+ypos3*40] = displayed_value3[29:27];
    assign framebuffer[148+ypos3*40:146+ypos3*40] = displayed_value3[26:24];
    assign framebuffer[188+ypos3*40:186+ypos3*40] = displayed_value3[23:21];
    assign framebuffer[228+ypos3*40:226+ypos3*40] = displayed_value3[20:18];
    assign framebuffer[268+ypos3*40:266+ypos3*40] = displayed_value3[17:15];

    assign framebuffer[113+ypos3*40:111+ypos3*40] = displayed_value3[14:12];
    assign framebuffer[153+ypos3*40:151+ypos3*40] = displayed_value3[11:9];
    assign framebuffer[193+ypos3*40:191+ypos3*40] = displayed_value3[8:6];
    assign framebuffer[233+ypos3*40:231+ypos3*40] = displayed_value3[5:3];
    assign framebuffer[273+ypos3*40:271+ypos3*40] = displayed_value3[2:0];
    
    
endmodule

