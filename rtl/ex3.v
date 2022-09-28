module ex3(q, a, b);
   output [3:0] q;
   input [1:0] 	a, b;  
   assign q = a + b * 2;
endmodule
