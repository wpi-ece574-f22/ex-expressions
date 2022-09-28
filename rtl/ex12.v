module ex12(q , a);
   output [2:0] q;
   reg [2:0] 	q, tmp;
   input [4:0] 	a;
   integer 	i;  
   always @(*) begin
      tmp = 0;
      tmp = tmp + a[0];
      tmp = tmp + a[1];
      tmp = tmp + a[2];
      tmp = tmp + a[3];
      tmp = tmp + a[4];
      q = tmp;
   end
endmodule
