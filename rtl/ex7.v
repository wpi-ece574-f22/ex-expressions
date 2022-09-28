module ex7(q , a, b);
   output q;
   reg 	  q;
   input [1:0] a;
   input       b;
   always @(a) begin
      if (a[1])      q = b;
      else if (a[0]) q = ~b;
   end
endmodule
