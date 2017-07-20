module MEMinstrucao(ck, endereco, saida);
  input ck;
  input [8:0] endereco;
  output [31:0] saida;
  reg [31:0] outInst[15:0];

  always @ ( posedge ck ) begin
  //algortimo 1
    outInst[0] = 32'b10110000000000000000000000000000; //wait
    outInst[1] = 32'b01010000001000000000000000000000;//in r1       //0
	 outInst[2] = 32'b00101000001000100000000000000000;//mov r1, r2  //100 
	 outInst[3] = 32'b01101000000000000000000000000100;//jal 4       //101
	 outInst[4] = 32'b00001100001000010000000000000001;//subi r1, r1, 1    //110
	 outInst[5] = 32'b01100000001000100001000000000000;//mult r1, r2, r2   //1000
	 outInst[6] = 32'b01010100010000000000000000000000; //out r1
	 outInst[7] = 32'b01101100010000000000000000000111;//beqi r2, 0, 7     //1010
	 outInst[8] = 32'b01101100001000000000010000000110;//beqi r1, 2, 6    //1011
	 outInst[9] = 32'b00111000000000000000000000000000; //jmpr r0         //1100
	 outInst[15] = 32'b00000000010000100011100000000000; // adc r2, r2, r3  //10011
	end

  assign saida = outInst[endereco];
  
endmodule 