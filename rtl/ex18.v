module ex18( 
	     input wire        clk,
	     input wire        reset,
	     output wire       q,
	     output wire       sync);
   
   localparam Sidle = 0, S0 = 1, S1 = 2;
   
   reg [1:0] 			 state, state_next;
   reg   			 d, d_next;
   
   always @(posedge clk, posedge reset)
     if (reset)
       begin
	  d <= 1'b0;
	  state <= Sidle;
       end
     else
       begin
	  d <= d_next;
	  state <= state_next;
       end
   
   reg syncvar;
   reg qvar;
   
   assign q = qvar;
   assign sync = syncvar;
   
   always @(*)
     begin
	syncvar = 1'b0;
	qvar   = 1'b0;
	
	d_next = d + 1;
	state_next = state;
	
	case (state)
	  Sidle:
	    state_next = S0;
	  
	  S0:
	    begin
	    syncvar = 1'b1;
	    qvar = d;
	    state_next = S1;
	    end
	  
	  S1:
	    begin
	    syncvar = 1'b0;
	    state_next = Sidle;
	    end
	  
	  default:
	    state_next = Sidle;
	endcase
	
     end
   
endmodule 
