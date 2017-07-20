module muxEndereco (ctrl, jIN, EA,EB, jOUT, Eout);
	input ctrl, jIN;
	input [8:0] EA, EB;
	output reg jOUT;
	output reg [8:0] Eout;
	
	always @(*) begin
		case (ctrl)
			1'b0: begin Eout = EA;	
							jOUT = jIN;
					end
			1'b1: begin Eout = EB;
							jOUT = 0;
					end
			default: Eout = 1'bx;
		endcase
	end
endmodule