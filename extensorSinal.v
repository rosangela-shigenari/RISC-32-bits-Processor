module extensorSinal (selectSize, imm12, imm16, imm21, imm9, imm18, out32);
	input [2:0] selectSize;
	input [11:0] imm12;
	input [15:0] imm16;
	input [20:0] imm21;
	input [8:0] imm9;
	input [17:0] imm18;
	output reg [31:0] out32;
	
	parameter i16 = 3'b0, i21 = 3'b01, i9 = 3'b10, i18 = 3'b11, i12 = 3'b100;
	
	always @ (*) begin
		case (selectSize)
			i16: out32 = {16'b0, imm16};
			i21: out32 = {11'b0, imm21};
			i9: out32 =  {23'b0, imm9};
			i18: out32 = {14'b0, imm18};
			i12: out32 = {10'b0, imm12};
		endcase
	end
endmodule
	 
	