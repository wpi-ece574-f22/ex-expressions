module ex5(q , a);
   output q;
   reg 	  q;
   input  a;
   initial q = 1;
   always @(a)
     q = ~a;
endmodule
