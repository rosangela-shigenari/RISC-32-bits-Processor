module regFile(readReg1, readReg2, writeReg, writeData, writeAddress,  readData1, readData2, ck);
	input [4:0] readReg1, readReg2;
	input [31:0] writeData;
	input [4:0] writeAddress;
	input ck, writeReg;
	output  [31:0] readData1, readData2;
	reg [31:0] registers[33:0];

	
	always @ (posedge ck) begin
		if (writeReg) 
			registers[writeAddress] = writeData;
	end
		
		assign readData1 = registers[readReg1];
	   assign readData2 = registers[readReg2];

endmodule
