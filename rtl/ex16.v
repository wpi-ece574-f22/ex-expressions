module ex16(output wire q , 
	    input wire enable, 
	    input wire clk, 
	    input wire d);
   reg 		       qr;   
   wire 	       gatedclk;
   assign gatedclk = clk & enable;
   always @(posedge gatedclk)
     qr <= d;
   assign q = qr;
endmodule
