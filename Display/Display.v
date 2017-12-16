module Display(clock, letter1, letter2, letter3, ypos1, ypos2, ypos3, framebuffer);
    input clock;
    input [7:0] letter1, letter2, letter3;
    input [4:0] ypos1, ypos2, ypos3;
    output reg [1199:0] framebuffer;

    wire [14:0] letter_left1, letter_right1, letter_left2, letter_right2, letter_left3, letter_right3;
    wire [29:0] displayed_value1, displayed_value2, displayed_value3;

    wire [14:0] letter1_left;
    wire [14:0] letter1_right;
    wire [14:0] letter2_left;
    wire [14:0] letter2_right;
    wire [14:0] letter3_left;
    wire [14:0] letter3_right;

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

    always @(*) begin 
        if(ypos1 >= 5'd22) //letter 1
            framebuffer[88:86] <= 0;
            framebuffer[128:126] <= 0;
            framebuffer[168:166] <= 0;
            framebuffer[208:206] <= 0;
            framebuffer[248:246] <= 0;
            
            framebuffer[93:91] <= 0;
            framebuffer[133:131] <= 0;
            framebuffer[173:171] <= 0;
            framebuffer[213:211] <= 0;
            framebuffer[253:251] <= 0;
        
        if(ypos2 >= 5'd22) //letter 2
            framebuffer[98:96] <= 0;
            framebuffer[138:136] <= 0;
            framebuffer[178:176] <= 0;
            framebuffer[218:216] <= 0;
            framebuffer[258:256] <= 0;
            
            framebuffer[103:101] <= 0;
            framebuffer[143:141] <= 0;
            framebuffer[183:181] <= 0;
            framebuffer[223:221] <= 0;
            framebuffer[263:261] <= 0;
            
        if(ypos3 >= 5'd22) // letter3
            framebuffer[108:106] <= 0;
            framebuffer[148:146] <= 0;
            framebuffer[188:186] <= 0;
            framebuffer[228:226] <= 0;
            framebuffer[268:266] <= 0;
            
            framebuffer[113:111] <= 0;
            framebuffer[153:151] <= 0;
            framebuffer[193:191] <= 0;
            framebuffer[233:231] <= 0;
            framebuffer[273:271] <= 0;
            
        else
            
        //letter 1
        framebuffer[88+ypos1*40] <= displayed_value1[29];
        framebuffer[87+ypos1*40] <= displayed_value1[28];
        framebuffer[86+ypos1*40] <= displayed_value1[27];
        
        framebuffer[128+ypos1*40] <= displayed_value1[26];
        framebuffer[127+ypos1*40] <= displayed_value1[25];
        framebuffer[126+ypos1*40] <= displayed_value1[24];
        
        framebuffer[168+ypos1*40] <= displayed_value1[23];
        framebuffer[167+ypos1*40] <= displayed_value1[22];
        framebuffer[166+ypos1*40] <= displayed_value1[21];
        
        framebuffer[208+ypos1*40] <= displayed_value1[20];
        framebuffer[207+ypos1*40] <= displayed_value1[19];
        framebuffer[206+ypos1*40] <= displayed_value1[18];
        
        framebuffer[248+ypos1*40] <= displayed_value1[17];
        framebuffer[247+ypos1*40] <= displayed_value1[16];
        framebuffer[246+ypos1*40] <= displayed_value1[15];
        
 
        framebuffer[93+ypos1*40] <= displayed_value1[14];
        framebuffer[92+ypos1*40] <= displayed_value1[13];
        framebuffer[91+ypos1*40] <= displayed_value1[12];
        
        framebuffer[133+ypos1*40] <= displayed_value1[11];
        framebuffer[132+ypos1*40] <= displayed_value1[10];
        framebuffer[131+ypos1*40] <= displayed_value1[9];
        
        framebuffer[173+ypos1*40] <= displayed_value1[8];
        framebuffer[172+ypos1*40] <= displayed_value1[7];
        framebuffer[171+ypos1*40] <= displayed_value1[6];
        
        framebuffer[213+ypos1*40] <= displayed_value1[5];
        framebuffer[212+ypos1*40] <= displayed_value1[4];
        framebuffer[211+ypos1*40] <= displayed_value1[3];
        
        framebuffer[253+ypos1*40] <= displayed_value1[2];
        framebuffer[252+ypos1*40] <= displayed_value1[1];
        framebuffer[251+ypos1*40] <= displayed_value1[0];

        //letter2
 
        framebuffer[98+ypos2*40] <= displayed_value2[29];
        framebuffer[97+ypos2*40] <= displayed_value2[28];
        framebuffer[96+ypos2*40] <= displayed_value2[27];
        
        framebuffer[138+ypos2*40] <= displayed_value2[26];
        framebuffer[137+ypos2*40] <= displayed_value2[25];
        framebuffer[136+ypos2*40] <= displayed_value2[24];
        
        framebuffer[178+ypos2*40] <= displayed_value2[23];
        framebuffer[177+ypos2*40] <= displayed_value2[22];
        framebuffer[176+ypos2*40] <= displayed_value2[21];
        
        framebuffer[218+ypos2*40] <= displayed_value2[20];
        framebuffer[217+ypos2*40] <= displayed_value2[19];
        framebuffer[216+ypos2*40] <= displayed_value2[18];
        
        framebuffer[258+ypos2*40] <= displayed_value2[17];
        framebuffer[257+ypos2*40] <= displayed_value2[16];
        framebuffer[256+ypos2*40] <= displayed_value2[15];
        
 
        framebuffer[103+ypos2*40] <= displayed_value2[14];
        framebuffer[102+ypos2*40] <= displayed_value2[13];
        framebuffer[101+ypos2*40] <= displayed_value2[12];
        
        framebuffer[143+ypos2*40] <= displayed_value2[11];
        framebuffer[142+ypos2*40] <= displayed_value2[10];
        framebuffer[141+ypos2*40] <= displayed_value2[9];
        
        framebuffer[183+ypos2*40] <= displayed_value2[8];
        framebuffer[182+ypos2*40] <= displayed_value2[7];
        framebuffer[181+ypos2*40] <= displayed_value2[6];
        
        framebuffer[223+ypos2*40] <= displayed_value2[5];
        framebuffer[222+ypos2*40] <= displayed_value2[4];
        framebuffer[221+ypos2*40] <= displayed_value2[3];
        
        framebuffer[263+ypos2*40] <= displayed_value2[2];
        framebuffer[262+ypos2*40] <= displayed_value2[1];
        framebuffer[261+ypos2*40] <= displayed_value2[0];
    
        //letter3

        framebuffer[108+ypos3*40] <= displayed_value3[29];
        framebuffer[107+ypos3*40] <= displayed_value3[28];
        framebuffer[106+ypos3*40] <= displayed_value3[27];
        
        framebuffer[148+ypos3*40] <= displayed_value3[26];
        framebuffer[147+ypos3*40] <= displayed_value3[25];
        framebuffer[146+ypos3*40] <= displayed_value3[24];
        
        framebuffer[188+ypos3*40] <= displayed_value3[23];
        framebuffer[187+ypos3*40] <= displayed_value3[22];
        framebuffer[186+ypos3*40] <= displayed_value3[21];
        
        framebuffer[228+ypos3*40] <= displayed_value3[20];
        framebuffer[227+ypos3*40] <= displayed_value3[19];
        framebuffer[226+ypos3*40] <= displayed_value3[18];
        
        framebuffer[268+ypos3*40] <= displayed_value3[17];
        framebuffer[267+ypos3*40] <= displayed_value3[16];
        framebuffer[266+ypos3*40] <= displayed_value3[15];
        
 
        framebuffer[113+ypos3*40] <= displayed_value3[14];
        framebuffer[112+ypos3*40] <= displayed_value3[13];
        framebuffer[111+ypos3*40] <= displayed_value3[12];
        
        framebuffer[153+ypos3*40] <= displayed_value3[11];
        framebuffer[152+ypos3*40] <= displayed_value3[10];
        framebuffer[151+ypos3*40] <= displayed_value3[9];
        
        framebuffer[193+ypos3*40] <= displayed_value3[8];
        framebuffer[192+ypos3*40] <= displayed_value3[7];
        framebuffer[191+ypos3*40] <= displayed_value3[6];
        
        framebuffer[233+ypos3*40] <= displayed_value3[5];
        framebuffer[232+ypos3*40] <= displayed_value3[4];
        framebuffer[231+ypos3*40] <= displayed_value3[3];
        
        framebuffer[273+ypos3*40] <= displayed_value3[2];
        framebuffer[272+ypos3*40] <= displayed_value3[1];
        framebuffer[271+ypos3*40] <= displayed_value3[0];
    end
           
endmodule

