module divisorFreq(Clk, ClkOut);
   input Clk;
   output reg ClkOut;
	
	parameter DivVal = 2500;
	reg[12:0] DivCnt;
   reg ClkInt;

   always @(posedge Clk) begin
         if( DivCnt == (DivVal-1) ) begin
            ClkOut <= ~ClkInt;
            ClkInt <= ~ClkInt;
            DivCnt <= 0;
         end
         else begin
            ClkOut <= ClkInt;
            ClkInt <= ClkInt;
            DivCnt <= DivCnt + 1;
         end
      end

endmodule