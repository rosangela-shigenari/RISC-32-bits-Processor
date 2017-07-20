module ULA  (controle, DA, DB, ULAresult, negativo, zero, overflow);
  input [4:0] controle;
  input [31:0] DA;
  input [31:0] DB;
  output reg [31:0] ULAresult;
  output zero;
  output negativo;
  integer i;
  reg [63:0] multResult;
  output reg overflow;
  reg [32:0] resultOF;
  
	parameter adc = 5'b0, sub = 5'b1, e = 5'b10, ou = 5'b11, n = 5'b100, 
	slel = 5'b101, sril = 5'b110, beq = 5'b111, bneq = 5'b1000, 
	blz = 5'b1001, slet =5'b1010, sgrt = 5'b1011, mult = 5'b1100, div = 5'b1101, 
	mod = 5'b1110, exor = 5'b1111, notand = 5'b10000, notor = 5'b10001, blt = 5'b10010, bgrt = 5'b10011;

  always @ (controle, DA, DB) begin
    case(controle)
      adc: begin 
		resultOF = DA + DB; //ADC
		overflow = 0;
		if(resultOF[32] == 1) begin
			overflow = 1;
			resultOF = 0;
		end
		ULAresult = resultOF;
		end
		
      sub: begin //sub
			ULAresult = DA - DB;	
			overflow = 0;
			end
      e: begin ULAresult = DA & DB; //AND 
			overflow = 0;
			end
      ou: begin ULAresult = DA | DB; //OR
			overflow = 0;
			end
      n: begin ULAresult = !DA;
			overflow = 0;
			end
		sril: begin ULAresult = DA >> DB; //set right logical
				overflow = 0;
				end
      slel: begin 
//			ULAresult = DA << DB;
			overflow = 0;
		end
      beq: begin 
				if (DA == DB) ULAresult = 0; //branch equal
				else ULAresult = 1;
				overflow = 0;
			 end
      bneq: begin
					if(DA != DB) ULAresult = 1; //branch not equal
					else ULAresult = 0;
					overflow = 0;
				end
      blz: begin 
			  ULAresult = DA;
			  overflow = 0;
			  end
      sgrt: begin if (DA > DB) ULAresult = 1; //set greater than
				else ULAresult =0;
				overflow = 0;
				end
      slet:  begin if (DA < DB) ULAresult = 1; //set less than
				else ULAresult =0;
				overflow = 0;
				end
		mult: begin
			overflow = 0;

				multResult = DA * DB;
				i = 32;
				while(i <= 63) begin
					if (multResult[i]) begin
						overflow = 1;
						multResult = 0;
					end
					i= i + 1;
				end
				ULAresult = multResult [31:0];
				
		end
		div: begin
			ULAresult = DA / DB;
			overflow = 0;
		end
		mod: begin
			ULAresult = DA % DB;
			overflow = 0;
		end
		exor: begin 
			ULAresult = DA  ^ DB;
			overflow = 0;
		end
		notand: begin 
			ULAresult = ~(DA & DB);
			overflow = 0;
		end
		notor: begin 
			ULAresult = ~(DA | DB);
			overflow = 0;
		end
		blt: begin
			if(DA<DB)
				ULAresult = 0;
			else
				ULAresult = 1;
			overflow = 0;
		end
		bgrt: begin 
			if(DA>DB)
				ULAresult = 0;
			else 
				ULAresult = 1;
			overflow = 0;
		end
		default: ULAresult = 0;
    endcase
    end
		
	assign zero = (ULAresult==0);
	assign negativo = ($signed (ULAresult) < 0);

endmodule
