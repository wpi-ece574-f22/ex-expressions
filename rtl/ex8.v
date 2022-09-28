module ex8(q , a, b);
   output q;
   reg 	  q;
   input [1:0] a;
   input       b;
   always @(*) begin
      q = 0;
      if (a[1])      q = b;
      else if (a[0]) q = ~b;
   end
endmodule
