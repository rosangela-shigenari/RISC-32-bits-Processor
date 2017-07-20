module muxEnd (ctrl,EA,EB,Eout);
	input ctrl;
	input [8:0] EA, EB;
	output reg [8:0] Eout;
	
	always @(*) begin
		case (ctrl)
			1'b0: Eout = EA;				
			1'b1:  Eout = EB;
		endcase
	end
endmodule
	