module ex6(q, a, b);
   output q;
   input  a, b;  
   reg 	  t;
   always @(a)
     begin
	t = a ^ 1;
	q = b ^ t;
     end
endmodule
