
module Seven_Seg_Test(SW, LEDG, HEX0, HEX1, HEX2, HEX3);
    input  [7:0] SW;
    output [6:0] HEX0, HEX1, HEX2, HEX3;
	output [7:0] LEDG;

    wire [6:0] seven_seg_hex0;
	wire [6:0] seven_seg_hex1;
    wire [6:0] ones_hex2;
    wire [6:0] tens_hex3;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
	
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

endmodule 