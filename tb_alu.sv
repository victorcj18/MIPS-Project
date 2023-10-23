module tb_alu; 

				parameter DATA_WIDTH=16;
				logic signed [DATA_WIDTH-1:0] a;
				logic signed [DATA_WIDTH-1:0] b; 
				logic [4:0] op;
				logic signed [DATA_WIDTH-1:0]result;
				logic zero;
				logic neg;
				logic grt;
				logic eq; 

				ALU #(.DATA_WIDTH(DATA_WIDTH)) ALU
				
				(.a(a), .b(b), .op(op), .result(result), .zero(zero), 
				.neg(neg), .grt(grt), .eq(eq));
				
				initial 
					begin
						
						a=16'd2;
						b=16'd3;
					end 
					always
					begin
						for (int i=0; i<15 ; i++)
							begin
							#10ns
								op=i; 
							end
							
						#10ns
						a = 16'd10;
						b = 16'd5;
						
						#10ns
						a = 16'd6;
						b = 16'd6;
						
					end 
endmodule

			   