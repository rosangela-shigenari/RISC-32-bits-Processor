module MUX(select, DA, DB, outMUX);

	input [31:0] DA, DB;
	input select;
	output reg[31:0] outMUX;
	
	always @ (*) begin
		case (select)
			1'b0: outMUX = DA;
			1'b1: outMUX = DB;
			1'bx: outMUX = 32'bx;
		endcase;
	end
endmodule