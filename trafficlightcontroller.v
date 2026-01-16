module trafficlightcontroller(
	input clk,
	input rst,
	output reg A_R,A_Y,A_G,
	output reg B_R,B_Y,B_G
);
	localparam s0 = 2'b00;
	localparam s1 = 2'b01;
	localparam s2 = 2'b10;
	localparam s3 = 2'b11;
	
	reg [1:0] state, next_state;
	reg [3:0] counter;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			state <= 0;
			counter <= 0;
		end
		else begin
			state <= next_state;
		
			if(state!=next_state)
				counter =0;
			else 
				counter = counter + 1;
		end 
	end
	
	always @(*) begin
	
		next_state = state;
		case(state)
			s0: if(counter==10) next_state = s1;
			s1: if(counter==3) next_state = s2;
			s2: if(counter==10) next_state = s3;
			s3: if(counter==3) next_state = s0;
		endcase
	end
	
	always @(*) begin
		A_R=0;A_Y=0;A_G=0;
		B_R=0;B_Y=0;B_G=0;
		case(state)
			s0: begin
				A_G=1;
				B_R=1;
			end
			s1: begin
				A_Y=1;
				B_R=1;
			end
			s2: begin
				A_R=1;
				B_G=1;
			end
			s3: begin
				A_R=1;
				B_Y=1;
			end
		endcase
	end
endmodule
	