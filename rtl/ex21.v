module ex21(output wire q, 
	    input wire i, 
	    input wire clk, 
	    input wire reset);

  reg rq;


  reg [1:0] state, state_next;

  localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

  always @(posedge clk or posedge reset)
    if (reset)
      begin
	 state <= s0;
      end
    else
      begin
	 state <= s0;
	 case (state)
	   s0:
	     begin
		if (i == 1'b1)
		  state <= s1;
		else
		  state <= s0;
	     end
	   s1:
	     begin
		if (i == 1'b1)
		  state <= s2;
		else
		  state <= s0;
	     end
	   s2:
	     begin
		if (i == 1'b1)
		  state <= s2;
		else
		  state <= s0;
	     end
	 endcase
      end

   assign q = (state == s1);
   
endmodule
