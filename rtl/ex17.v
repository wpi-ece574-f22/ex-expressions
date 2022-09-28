module ex17(output wire q , 
	    input wire enable, 
	    input wire clk, 
	    input wire d);
   reg 		       qr;   
   always @(posedge clk)
     if (enable)
       qr <= d;
   assign q = qr;
endmodule
