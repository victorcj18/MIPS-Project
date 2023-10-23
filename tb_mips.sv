module tb_mips;
		// im
		parameter IM_ADDRESS_WIDTH = 6;
		parameter INSTRUCTION_WIDTH = 32;
		// rf
		parameter RF_ADDRESS_WIDTH=5;
		parameter DATA_WIDTH=16; // works with alu.

		// im
		logic [IM_ADDRESS_WIDTH-1:0] addr;
		logic [INSTRUCTION_WIDTH-1:0] Q;
		// rf
		logic clk;
		logic asyn_n_rst;
		logic [DATA_WIDTH-1:0] result;


		mips #(
				IM_ADDRESS_WIDTH,
				INSTRUCTION_WIDTH,
				
				RF_ADDRESS_WIDTH,
				DATA_WIDTH
		) MPIS0 (
				addr,
				Q,
				
				clk,
				asyn_n_rst,
				result
		);
		
		initial
			begin
				addr = 4'b0;
				clk = 0;
				asyn_n_rst = 0;
			end
			
		always
			begin
				clk = ~clk;
				#25ns;
			end
			
		always
			begin
				#50ns
				asyn_n_rst = 1;
				#50ns;
				
			end


endmodule
