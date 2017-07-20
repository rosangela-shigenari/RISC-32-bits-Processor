module UC (opcode, onWriteReg, writeDataMem, onop, onskip, muxEnd,  
ctrlM5, selectSize, selectDado, selectD, HLT, endPCorReg, flagw, outputEnable, notOUT);
input [5:0] opcode;
output reg onWriteReg, writeDataMem, onop, onskip, muxEnd, flagw, outputEnable, notOUT;
output reg [1:0] ctrlM5, selectDado;
output reg [2:0] selectSize;
output reg selectD, HLT, endPCorReg;

parameter adc = 6'b0, sub = 6'b1, adci = 6'b10, subi = 6'b00011, And = 6'b100, Or = 6'b101, Not = 6'b110,
lowo = 6'b00111, stwo = 6'b01000, loi = 6'b1001, mov = 6'b01010, slel = 6'b01011, sril = 6'b1100, jump = 6'b1101,
jmpr = 6'b01110, beq = 6'b01111, bneq = 6'b10000, blz = 6'b10001, slet = 6'b10010, sgrt = 6'b10011, in = 6'b10100,
out = 6'b10101, nop = 6'b10110, hlt = 6'b10111, mult = 6'b11000, multi = 6'b11001, jal = 6'b11010, beqi = 6'b11011, 
bneqi = 6'b11100, div = 6'b11101, divi = 6'b11110, mod = 6'b11111, modi = 6'b100000, sleti = 6'b100001, sgrti = 6'b100010,
exclusiveOR = 6'b100011, notand = 6'b100100, notor = 6'b100101, andi = 6'b100110, ori = 6'b100111, blt = 6'b101000, 
bgrt= 6'b101001, blti = 6'b101010, bgrti = 6'b101011, scan = 6'b101100;

always @ (opcode) begin
	case (opcode) 
		adc: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		sub:  begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		adci:  begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;
		   flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;		
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		subi:
		begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		And: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;
		   flagw = 0;
			notOUT = 1;		
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;	
			HLT = 0;
			endPCorReg = 0;
		end
		Or:  begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
	Not: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
	lowo: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 2'b10;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		stwo: begin
			onWriteReg = 0;
			writeDataMem = 1;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'bx;	
			selectSize = 3'b0;
			selectDado = 2'bx;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		loi: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 0;	
			selectSize = 3'b01;
			selectDado = 2'b11;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		mov: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'bx;
			selectDado = 2'b01;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		slel: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		sril: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 1;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		jump: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		jmpr: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 0;	
			selectSize = 0;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 1;
		end
		beq: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 0;	
			HLT = 0;
			endPCorReg = 0;
		end
		bneq: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		blz: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		slet: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;
		   flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		sgrt: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		in: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b0;	
			selectSize = 3'b11;
			selectDado = 2'b11;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		out: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 1;	
			flagw = 0;
			notOUT = 0;	
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		nop: 
		begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;	
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 0;
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		hlt: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 0;
			onop = 0;	
			onskip = 0;
			muxEnd = 1;
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 1'bx;
			HLT = 1;
			endPCorReg = 0;
		end
		mult: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;	
			HLT = 0;
			endPCorReg = 0;
		end
		multi: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
			end
		jal: begin 
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 0;	
			onskip = 1;
			muxEnd = 0;		
			ctrlM5 = 2'b00;	
			selectSize = 3'b10;
			selectDado = 2'b11;	
			selectD = 1'bx;
			HLT = 0;
			endPCorReg = 0;
		end
		beqi: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'b100;
			selectDado = 2'bx;	
			selectD = 1;	
			HLT = 0;
			endPCorReg = 0;
		end
		bneqi: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'b100;
			selectDado = 2'bx;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		div: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		divi: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b1;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		mod: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		modi: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b1;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end		
		sleti: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		sgrti: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b1;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		exclusiveOR: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		notand: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		notor: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'b10;	
			selectSize = 3'bx;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
		andi: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		ori: begin
			onWriteReg = 1;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 0;
			muxEnd = 1;
			ctrlM5 = 2'b01;	
			selectSize = 3'b0;
			selectDado = 0;	
			selectD = 1;
			HLT = 0;
			endPCorReg = 0;
		end
		blt: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 0;	
			HLT = 0;
			endPCorReg = 0;
		end
		bgrt: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 0;	
			HLT = 0;
			endPCorReg = 0;
		end
		blti: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'b100;
			selectDado = 2'bx;	
			selectD = 1;	
			HLT = 0;
			endPCorReg = 0;
		end
		bgrti: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 1;	
			onskip = 1;
			muxEnd = 0;	
			ctrlM5 = 2'bx;	
			selectSize = 3'b100;
			selectDado = 2'bx;	
			selectD = 1;	
			HLT = 0;
			endPCorReg = 0;
		end
		scan: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 1;
			notOUT = 0;
			onop = 0;	
			onskip = 0;
			muxEnd = 1;	
			ctrlM5 = 2'bx;	
			selectSize = 3'bx;
			selectDado = 2'bx;	
			selectD = 1;	
			HLT = 0;
			endPCorReg = 0;
		end
		default: begin
			onWriteReg = 0;
			writeDataMem = 0;	
			outputEnable = 0;	
			flagw = 0;
			notOUT = 1;
			onop = 0;	
			onskip = 0;
			muxEnd = 0;	
			ctrlM5 = 0;	
			selectSize = 0;
			selectDado = 0;	
			selectD = 0;
			HLT = 0;
			endPCorReg = 0;
		end
	endcase
end
	
endmodule
