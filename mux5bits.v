module mux5bits (ctl, DA, DB, DC, outD);
	input [1:0] ctl;
	input [4:0] DA, DB, DC;
	output reg [4:0] outD;
	
	always @ (*) begin
		case (ctl) 
			2'b00: outD = DA;
			2'b01: outD = DB;
			2'b10: outD = DC;
			default: outD = 0;
		endcase
	end
endmodule