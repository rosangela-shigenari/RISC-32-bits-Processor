module controle1 (ONcontrole1, controle, jump, pc, endereco, zero, negativo, endout);
	input ONcontrole1;
	input [5:0] controle;
	input [8:0] endereco, pc;
	input zero, negativo;
	output reg jump;
	output reg [8:0] endout;
	reg [8:0] add;
	
	parameter beq = 6'b01111, bneq = 6'b10000, blz = 6'b10001, jmp = 6'b01101, jmpr = 6'b01110, jal = 6'b11010,
	beqi = 6'b11011, bneqi = 6'b11100, blt = 6'b101000, bgrt= 6'b101001, blti = 6'b101010, bgrti = 6'b101011;
	
	
	always @ (*) begin 
		add = pc;
		if (ONcontrole1) begin
		case (controle)
			beq:
				if(zero==1) begin
					endout = add + endereco;
					jump =0;
				end
				else begin 
					endout = add;
					jump = 0;
				end
			beqi:
				if(zero==1) begin
					endout = add + endereco;
					jump =0;
				end
				else begin 
					endout = add;
					jump = 0;
				end
			bneq:
				if(zero == 0) begin
					endout = add + endereco;
					jump =0;
				end
				else begin 
					endout = add;
					jump = 0;
				end
			bneqi:
				if(zero == 0) begin
					endout = add + endereco;
					jump =0;
				end
				else begin 
					endout = add;
					jump = 0;
				end
			blz:
				if(negativo==1) begin
					endout = add + endereco;
					jump = 0;
				end
				else begin 
					endout = add;
					jump = 0;
				end
			jmp: begin
				endout = endereco;
				jump = 1;
			end
			jmpr: begin
				endout = endereco;
				jump = 1;
			end
			jal: begin
				endout = endereco;
				jump = 1;
			end
			blt: begin
				if(zero==1) 
					endout = add + endereco;
				else
					endout = add;
				jump = 0;
			end
			bgrt: begin
				if(zero==1) 
					endout = add + endereco;
				else
					endout = add;
				jump = 0;
			end
			blti: begin
				if(zero==1) 
					endout = add + endereco;
				else 
					endout = add;
				jump = 0;
			end
			bgrti: begin
				if(zero==1) 
					endout = add + endereco;
				else 
					endout = add;
				jump = 0;
			end
		endcase	
	end
	end
endmodule 