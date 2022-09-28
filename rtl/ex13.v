module ex13(q , a);
   output [2:0] q;
   reg [2:0] 	q, tmp;
   input [4:0] 	a;
   integer 	i;  
   always @(*) begin
      q = 0 + a[0] + a[1] + a[2] + a[3] + a[4];
   end
endmodule
