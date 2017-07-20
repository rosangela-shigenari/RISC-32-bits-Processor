module display7segmentos(numero, outDisplay);	

	input [3:0] numero;
	output reg [6:0] outDisplay;
	
	always@(*)
		case(numero)
			4'b0000 : outDisplay = ~7'b1111110;//0
			4'b0001 : outDisplay = ~7'b0110000;//1
			4'b0010 : outDisplay = ~7'b1101101;//2
			4'b0011 : outDisplay = ~7'b1111001;//3
			4'b0100 : outDisplay = ~7'b0110011;//4
			4'b0101 : outDisplay = ~7'b1011011;//5
			4'b0110 : outDisplay = ~7'b1011111;//6
			4'b0111 : outDisplay = ~7'b1110000;//7
			4'b1000 : outDisplay = ~7'b1111111;//8
			4'b1001 : outDisplay = ~7'b1111011;//9
			4'b1010 : outDisplay = ~7'b0000000;//blank
			4'b1011 : outDisplay = ~7'b0000001;// -- ---- --
			4'b1100 : outDisplay = ~7'b0110111;//H
			4'b1101 : outDisplay = ~7'b0001110; //L
			4'b1110 : outDisplay = ~7'b1000110; // T
			default : outDisplay = ~7'b0000000;//blank
		endcase

endmodule 