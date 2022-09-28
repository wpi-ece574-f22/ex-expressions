module ex2(q, a, b, c);
   output [3:0] q;
   input [1:0] 	 a, b, c;  
   assign q = a + b * c;
endmodule
