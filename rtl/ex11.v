module ex11(q , a);
   output [2:0] q;
   reg [2:0] 	q, tmp;
   input [4:0] 	a;
   integer 	i;  
   always @(*) begin
      tmp = 0;
      for (i=0; i<5; i = i + 1)
	tmp = tmp + a[i];
      q = tmp;
   end
endmodule
