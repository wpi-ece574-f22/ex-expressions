module ex1(q, a, b);
  output q;
  input a, b;
  
  assign q = (a & ~b) | (~a & b);

endmodule
