module tb_im();

		parameter IM_ADDRESS_WIDTH = 6;		// log2(64)
		parameter INSTRUCTION_WIDTH = 32;

		logic [IM_ADDRESS_WIDTH-1:0] addr;
		logic [INSTRUCTION_WIDTH-1:0] Q;
		
		im #(
				.IM_ADDRESS_WIDTH(IM_ADDRESS_WIDTH),
				.INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)
		) IM0 (
				.addr(addr),
				.Q(Q)
		);
		
		initial
			begin
				addr = 0;
				#100ns;
			end
		
		always 
			begin
				for (int i = 0; i < IM_ADDRESS_WIDTH; i++)
					begin
						addr = i;
						#20ns;
					end
			end

		
endmodule
