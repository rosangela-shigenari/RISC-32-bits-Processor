module MEMdados(ck, ONescrita, dadoEscrita, endereco, dadoLeitura);
	input ck, ONescrita;
	input [8:0] endereco;
	input [31:0] dadoEscrita;
	output reg[31:0] dadoLeitura;	
	reg [31:0] memoria [31:0];
	
	always @ (negedge ck) begin	
		if (ONescrita) begin
			memoria[endereco] = dadoEscrita;
			dadoLeitura = 0;
		end
		else
			dadoLeitura = memoria[endereco];
	end	

endmodule
