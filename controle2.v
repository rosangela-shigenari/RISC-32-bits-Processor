module controle2(nfuncao, onOP, controle);
	input [5:0] nfuncao;
	input onOP;
	output reg [4:0] controle;

	parameter adc = 6'b00000, sub = 6'b00001, adci = 6'b00010, subi = 6'b00011, e = 6'b00100,
	ou = 6'b00101, n = 6'b00110, lowo = 6'b00111 , stwo = 6'b01000, slel = 6'b01011,
	sril = 6'b01100, beq = 6'b01111, bneq = 6'b10000, blz = 6'b10001, slet = 6'b10010,
	sgrt = 6'b10011, mult = 6'b11000, multi = 6'b11001, beqi = 6'b11011, bneqi = 6'b11100,
	div = 6'b11101, divi = 6'b11110, mod = 6'b11111, modi = 6'b100000, sleti = 6'b100001, 
	sgrti = 6'b100010, exclusiveOR = 6'b100011, notand = 6'b100100, notor = 6'b100101, 
	andi = 6'b100110, ori = 6'b100111, blt = 6'b101000, bgrt= 6'b101001, blti = 6'b101010, 
	bgrti = 6'b101011;
	
	always @(*) begin
		if(onOP) begin
			case (nfuncao)
				adc: controle = 5'b0;
				sub: controle = 5'b1;
				adci: controle = 5'b0;
				subi: controle = 5'b1;
				e: controle = 5'b10;
				ou: controle = 5'b11;
				n: controle = 5'b100;
				lowo: controle = 5'b0;
				stwo: controle = 5'b0;
				slel: controle = 5'b101;
				sril: controle = 5'b110;
				beq: controle = 5'b111;
				bneq: controle = 5'b1000;
				blz: controle = 5'b1001;
				slet: controle = 5'b1010;
				sgrt: controle = 5'b1011;
				mult: controle = 5'b1100;
				multi: controle = 5'b1100;
				beqi: controle = 5'b111;
				bneqi: controle = 5'b1000;
				div: controle = 5'b1101;
				divi: controle = 5'b1101;
				mod: controle = 5'b1110;
				modi: controle = 5'b1110;
				sleti: controle = 5'b1010;
				sgrti: controle = 5'b1011;
				exclusiveOR: controle = 5'b1111;
				notand: controle = 5'b10000;
				notor: controle = 5'b10001;
				andi: controle = 5'b10;
				ori: controle = 5'b11;
				blt: controle = 5'b10010;
				bgrt: controle = 5'b10011;
				blti: controle = 5'b10010;
				bgrti: controle = 5'b10011;
				
				default: controle = 5'b11111;
				endcase
			end
		else controle = 5'b11111;
	end
endmodule 