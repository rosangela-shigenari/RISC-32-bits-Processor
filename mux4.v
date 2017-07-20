module mux4 (select, DA, DB,DC, DD, outD);
input [1:0] select;
input [31:0] DA, DB, DC, DD;
output reg [31:0] outD;
	
always @ (*) begin
 case (select)
	2'b0: outD = DA;
	2'b01: outD = DB;
	2'b10: outD = DC;
	2'b11: outD = DD;
 endcase
end
endmodule