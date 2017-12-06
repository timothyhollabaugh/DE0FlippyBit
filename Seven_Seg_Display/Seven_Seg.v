
module Seven_Seg(in, out);
	input [3:0]in;
	output [6:0]out;
	
	wire A, B, C, D, E, F, G;
	wire W, X, Y, Z;
	
	assign {W, X, Y, Z} = in;
	
	// A = X'Z' + WX'Y' + W'XZ + WZ' + XY + W'Y
	assign A = ~X & ~Z | W & ~X & ~Y | ~W & X & Z | W & ~Z | X & Y | ~W & Y;
	
	// B = X'Z' + WY'Z + W'YZ + W'Y'Z' + W'X'
	assign B = ~X & ~Z | W & ~Y & Z | ~W & Y & Z | ~W & ~Y & ~Z | ~W & ~X;
	
	// C = w'y'+wx'+y'z+w'x+w'z
	assign C = ~W & ~Y | W & ~X | ~Y & ~X | ~Y & Z | ~W & X | ~W & Z;
	
	//     D =  X'  Y   Z +  W'   X'   Z'+ W    Y'   Z'+ X    Y'  Z + X   Y    Z'
	assign D = ~X & Y & Z | ~W & ~X & ~Z | W & ~Y & ~Z | X & ~Y & Z | X & Y & ~Z;
	
	//     E =  X'   Z'+ W   Y + Y    Z'+ W   X
	assign E = ~X & ~Z | W & Y | Y & ~Z | W & X;
	
	// F = Y'Z'+W'XY'+XZ'+WX'+WY
	assign F = ~Y & ~Z | ~W & X & ~Y | X & ~Z | W & ~X | W & Y;
	
	// G = X'Y+YZ'+W'XY'+WZ+WX'
	assign G = ~X & Y | Y & ~Z | ~W & X & ~Y | W & Z | W & ~X;
	
	assign out = {G, F, E, D, C, B, A};
	
endmodule
