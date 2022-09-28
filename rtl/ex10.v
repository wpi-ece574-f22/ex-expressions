module ex10(q , a, b);
   output q;
   reg 	  q;
   input [1:0] a;
   input       b;
   always @(*) begin
      case (a)
	1: q = ~b;
	2: q =  b;
	default: q = 0;
      endcase
   end
endmodule
