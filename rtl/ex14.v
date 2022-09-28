module ex14(input wire d,
	    input wire reset,
	    input wire 	clk, 
	    output wire q1, 
	    output wire q2);
   
   reg 			q1r, q2r;

   always @(posedge clk or posedge reset)
     begin
	if (reset)
	  begin
	     q1r <= 1'b0;
	     q2r <= 1'b0;
	  end 
	else
	  begin	    
	     q1r <= q2r;
	     q2r <= q1r ^ d;
	  end
     end

   assign q1 = q1r;
   assign q2 = q2r;
   
endmodule
   
