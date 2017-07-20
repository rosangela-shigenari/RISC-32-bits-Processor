module unidadeProcessamento(clk, switches, reset, zero, neg, overflow, nHLT, endereco, result,
sdmilhao, smilhao, scmilhar, sdmilhar, smilhar ,scentesimal, sdecimal, sunidade) ;
	
	output  [8:0] endereco;
	input [17:0] switches;
   //input wire ck, ckin;
	input nHLT;
	input clk;
	input wire reset;
	wire [31:0] DA, DB;
	wire [31:0] instrucao, wd, outIM, outmuxdado;
	wire onWriteReg, writeDataMem, outputEnable, onop, onskip, muxEnd;
	wire hlt, endPCorReg, flagw, notOUT ;
	wire [1:0] ctrlM5, selectDado;
	wire [2:0] selectSize;
	wire selectD;
	wire [4:0] gravaEnd, reg1, ende;
	wire [31:0] outmux, outIOunit;
	wire [31:0] dadoLeitura;
	wire [8:0] outskip, skipEnd, pcin;
	wire  j, jmp;
	output wire zero, neg;
	wire [4:0] controle;
	output wire overflow;
	wire [31:0] outOC;
	wire [3:0] dmilhao , milhao, cmilhar, dmilhar, centesimal, milhar, decimal, unidade;
	output [6:0] sdmilhao, smilhao, scmilhar, sdmilhar, smilhar ,scentesimal, sdecimal, sunidade;
	output [31:0]result;
	
	
	wire neg_nHLT;
	wire neg_reset;
	
	assign neg_nHLT =  ~nHLT;
	assign neg_reset = ~reset;
	

		
	/*DeBounce DEBOUNCE (.clk(ck),
				 .n_reset(1),
				 .button_in(~ckin),
				 .DB_out(clk)
				 );*/
			 
	MEMinstrucao memoria_de_instruoes_fatorial(.ck(clk), 
					 .endereco(endereco), 
					 .saida(instrucao));
		 
	UC unidade_de_controle(.opcode(instrucao[31:26]), 
		 .onWriteReg(onWriteReg), 
		 .writeDataMem(writeDataMem), 
		 .onop(onop), 
		 .onskip(onskip), 
		 .muxEnd(muxEnd), 
		 .ctrlM5(ctrlM5), 
		 .selectSize(selectSize), 
		 .selectDado(selectDado), 
		 .selectD(selectD), 
		 .HLT(hlt),
		 .endPCorReg(endPCorReg),
		 .flagw (flagw), 
		 .outputEnable(outputEnable), 
		 .notOUT(notOUT)
);
	programCounter Program_counter(.ck(clk), 
							 .jump(jmp), 
							 .endereco(pcin),
							 .nHLT(neg_nHLT),
							 .reset(neg_reset),
							 .OUTendereco(endereco),
							 .hlt(hlt)
);
						 
	muxEndereco selecionaProxEndereco(.ctrl(muxEnd), 
					 .jIN(j), 
					 .EA(outskip),
					 .EB(endereco), 
					 .jOUT(jmp), 
					 .Eout(pcin)
	);

	mux5bits selecionaOndeGrava(.ctl(ctrlM5), 
				 .DA(instrucao[25:21]), 
				 .DB(instrucao[20:16]), 
				 .DC(instrucao[15:11]),
				 .outD(gravaEnd)
	);

	regFile Banco_de_Registradores(.readReg1(instrucao[25:21]), 
			  .readReg2(instrucao[20:16]), 
			  .writeReg(onWriteReg), 
			  .writeData(outmux), 
			  .writeAddress(gravaEnd), 
			  .readData1(DA), 
			  .readData2(DB), 
			  .ck(clk)
	);
	
	extensorSinal Extensor_de_Sinal(.selectSize(selectSize), 
											  .imm12(instrucao[20:9]),
											  .imm16(instrucao[15:0]), 
											  .imm21(instrucao[20:0]), 
											  .imm9(endereco),
											  .imm18(switches),
											  .out32(wd)
	);
	MUX selecionaImediatoOuReg (.select(selectD), 
				.DA(DB), 
				.DB(wd), 
				.outMUX(outIM)
	);
	controle2 OPcontrol(.nfuncao(instrucao[31:26]), 
				 .onOP(onop), 
				 .controle(controle)
	);
	ULA Unidade_Logica_Aritmetica(.controle(controle), 
		 .DA(DA), 
		 .DB(outIM), 
		 .ULAresult(result), 
		 .negativo(neg), 
		 .zero(zero),
		 .overflow(overflow)
	);
	
	muxEnd PCorREG(.ctrl(endPCorReg),
						.EA(instrucao[8:0]),
						.EB(DA[8:0]),
						.Eout(skipEnd));
						
	controle1 skip (.ONcontrole1(onskip), 
				  .controle(instrucao[31:26]), 
				  .jump(j), 
				  .pc(endereco), 
				  .endereco(skipEnd), 
				  .zero(zero), 
				  .negativo(neg), 
				  .endout(outskip));
	
	MEMdados memoria_de_dados(.ck(clk), 
									  .ONescrita(writeDataMem), 
									  .dadoEscrita(DB), 
									  .endereco(result[8:0]), 
									  .dadoLeitura(dadoLeitura)
	);
//	
	mux4 selecionaOdadoQueVaiSerGravadoNoBanco(.select(selectDado), 
			.DA(result), 
			.DB(DA),
			.DC(dadoLeitura), 
			.DD(wd), 
			.outD(outmux)
	);
						
							
	binToBCD(.flagw(flagw), 
				.outputEnable(outputEnable), 
				.notOUT(notOUT),
				.HLT(hlt),
				.dataBin(DA), 
				.dmilhao(dmilhao), 
				.milhao(milhao), 
				.cmilhar(cmilhar), 
				.dmilhar(dmilhar), 
				.milhar(milhar), 
				.centesimal(centesimal), 
				.decimal(decimal), 
				.unidade(unidade));
				
	display7segmentos H (.numero(dmilhao), .outDisplay(sdmilhao));
				
	display7segmentos G (.numero(milhao), .outDisplay(smilhao));
				
	display7segmentos F (.numero(cmilhar), .outDisplay(scmilhar));
	
	display7segmentos E (.numero(dmilhar), .outDisplay(sdmilhar));
				
	display7segmentos D (.numero(milhar), .outDisplay(smilhar));
				
	display7segmentos C (.numero(centesimal), .outDisplay(scentesimal));
				
	display7segmentos B (.numero(decimal), .outDisplay(sdecimal));
				
	display7segmentos A (.numero(unidade), .outDisplay(sunidade));

	
endmodule
	