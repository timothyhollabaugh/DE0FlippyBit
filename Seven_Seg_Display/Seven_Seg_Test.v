
module Seven_Seg_Test(SW, LEDG, HEX0, HEX1);
    input [7:0] SW;
    output [6:0] HEX0, HEX1;
	output [7:0] LEDG;

    wire [6:0] seven_seg_hex0;
	wire [6:0] seven_seg_hex1;
	
    assign LEDG = SW;
    assign HEX0 = ~seven_seg_hex0;
    assign HEX1 = ~seven_seg_hex1;

    Seven_Seg hex0 (SW [3:0], seven_seg_hex0);
    Seven_Seg hex1 (SW [7:4], seven_seg_hex1); 

endmodule 