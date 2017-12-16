module letter_stuff(letter, letter_left, letter_right);
    input [7:0] letter;
    output reg [14:0]letter_left, letter_right;

    always @(letter[7:4]) begin 
        case (letter[7:4])
            4'b0000: letter_left <= 15'b111101101101111; //0 !
            4'b0001: letter_left <= 15'b100100100100100; //001001001001001 1 !
            4'b0010: letter_left <= 15'b111100111001111; //111001111100111 2 !
            4'b0011: letter_left <= 15'b111100111100111; //111001111001111 3 !
            4'b0100: letter_left <= 15'b101101111100100; //101101111001001 4 !
            4'b0101: letter_left <= 15'b111001111100111; //111100111001111 5 !
            4'b0110: letter_left <= 15'b111001111101111; //111100111101111 6 !
            4'b0111: letter_left <= 15'b111100100100100; //111001001001001 7 !
            4'b1000: letter_left <= 15'b111101111101111; //8 !
            4'b1001: letter_left <= 15'b111101111100111; //111101111001111 9 !
            4'b1010: letter_left <= 15'b111101111101101; //A !
            4'b1011: letter_left <= 15'b001001111101111; //100100111101111 B !
            4'b1100: letter_left <= 15'b111001001001111; //111100100100111 C !
            4'b1101: letter_left <= 15'b100100111101111; //001001111101111 D !
            4'b1110: letter_left <= 15'b111001110001111; //111100110100111 E
            4'b1111: letter_left <= 15'b001001111001111; //111100111100100 F
        endcase
    end

    always @(letter[3:0]) begin 
        case (letter[3:0]) 
            4'b0000: letter_right <= 15'b111101101101111; //0 !
            4'b0001: letter_right <= 15'b100100100100100; //001001001001001 1 !
            4'b0010: letter_right <= 15'b111100111001111; //111001111100111 2 !
            4'b0011: letter_right <= 15'b111100111100111; //111001111001111 3 !
            4'b0100: letter_right <= 15'b101101111100100; //101101111001001 4 !
            4'b0101: letter_right <= 15'b111001111100111; //111100111001111 5 !
            4'b0110: letter_right <= 15'b111001111101111; //111100111101111 6 !
            4'b0111: letter_right <= 15'b111100100100100; //111001001001001 7 !
            4'b1000: letter_right <= 15'b111101111101111; //8 !
            4'b1001: letter_right <= 15'b111101111100111; //111101111001001 9 !
            4'b1010: letter_right <= 15'b111101111101101; //A !
            4'b1011: letter_right <= 15'b001001111101111; //100100111101111 B !
            4'b1100: letter_right <= 15'b111001001001111; //111100100100111 C !
            4'b1101: letter_right <= 15'b100100111101111; //001001111101111 D !
            4'b1110: letter_right <= 15'b111001110001111; //111100110100111 E
            4'b1111: letter_right <= 15'b001001111001111; //111100111100100 F
        endcase	
    end
    
endmodule
