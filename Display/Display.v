module Display(letter, clock, ypos1, ypos2, ypos3, framebuffer);
    input [7:0]letter;
    input clock;
    input [4:0] ypos1, ypos2, ypos3;
    output [1199:0] framebuffer;

    /* 
    VGA is 40 pixels wide by 30 pixels high
    */

    //wire [7:0]letter;
    //assign letter = 8'b01101100; // test for "6 C"

    reg [14:0]letter1, letter2; //letter 1 is the left letter; letter 2 is right
    wire [29:0]displayed_value1, displayed_value2, displayed_value3;

    always @(letter[7:4]) begin 
        case (letter[7:4])
            4'b0000: letter1 <= 15'b111101101101111; //0 !
            4'b0001: letter1 <= 15'b100100100100100; //001001001001001 1 !
            4'b0010: letter1 <= 15'b111100111100111; //111001111100111 2
            4'b0011: letter1 <= 15'b111100111100111; //111001111001111 3 !
            4'b0100: letter1 <= 15'b101101111100100; //101101111001001 4
            4'b0101: letter1 <= 15'b111001111100111; //111100111001111 5
            4'b0110: letter1 <= 15'b111001111101111; //111100111101111 6
            4'b0111: letter1 <= 15'b111100100100100; //111001001001001 7
            4'b1000: letter1 <= 15'b111101111101111; //8 !
            4'b1001: letter1 <= 15'b111101111100111; //111101111001111 9
            4'b1010: letter1 <= 15'b111101111101101; //A !
            4'b1011: letter1 <= 15'b001001111101111; //100100111101111 B !
            4'b1100: letter1 <= 15'b111001001001111; //111100100100111 C !
            4'b1101: letter1 <= 15'b100100111101111; //001001111101111 D !
            4'b1110: letter1 <= 15'b111001110001111; //111100110100111 E
            4'b1111: letter1 <= 15'b111001111100111; //111100111100100 F
        endcase
    end

    always @(letter[3:0]) begin 
        case (letter[3:0]) 
            4'b0000: letter2 <= 15'b111101101101111; //0 !
            4'b0001: letter2 <= 15'b100100100100100; //001001001001001 1
            4'b0010: letter2 <= 15'b111100111100111; //111001111100111 2
            4'b0011: letter2 <= 15'b111100111100111; //111001111001111 3
            4'b0100: letter2 <= 15'b101101111100100; //101101111001001 4
            4'b0101: letter2 <= 15'b111001111100111; //111100111001111 5
            4'b0110: letter2 <= 15'b111001111101111; //111100111101111 6
            4'b0111: letter2 <= 15'b111100100100100; //111001001001001 7
            4'b1000: letter2 <= 15'b111101111101111; //8 !
            4'b1001: letter2 <= 15'b111101111100111; //111101111001001 9
            4'b1010: letter2 <= 15'b111101111101101; //A !
            4'b1011: letter2 <= 15'b001001111101111; //100100111101111 B
            4'b1100: letter2 <= 15'b111001001001111; //111100100100111 C
            4'b1101: letter2 <= 15'b100100111101111; //001001111101111 D
            4'b1110: letter2 <= 15'b111001110001111; //111100110100111 E
            4'b1111: letter2 <= 15'b111001111100111; //111100111100100 F
        endcase	
    end

    assign displayed_value2[29:15] = letter1;
    assign displayed_value2[14:0] = letter2;

    assign framebuffer[98:96] = displayed_value2[29:27];
    assign framebuffer[138:136] = displayed_value2[26:24];
    assign framebuffer[178:176] = displayed_value2[23:21];
    assign framebuffer[218:216] = displayed_value2[20:18];
    assign framebuffer[258:256] = displayed_value2[17:15];

    assign framebuffer[103:101] = displayed_value2[14:12];
    assign framebuffer[143:141] = displayed_value2[11:9];
    assign framebuffer[183:181] = displayed_value2[8:6];
    assign framebuffer[223:221] = displayed_value2[5:3];
    assign framebuffer[263:261] = displayed_value2[2:0];
endmodule

