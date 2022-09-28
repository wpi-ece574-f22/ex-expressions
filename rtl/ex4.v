module ex4(q, a, b);
   output [3:0] q;
   input [3:0] 	 a, b;  
   assign q = a % b;
endmodule
