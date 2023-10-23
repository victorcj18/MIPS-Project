module tb_dm;

		parameter DATA_WIDTH = 16;
		parameter DM_ADDRESS_WIDTH = 6;
		
		logic clk;
		logic we;
		logic [DATA_WIDTH-1:0] D;
		logic [DM_ADDRESS_WIDTH-1:0] addr;
		logic [DATA_WIDTH-1:0] Q;
		
		dm #(
			DATA_WIDTH,
			DM_ADDRESS_WIDTH
		) DM0 (
			.*
		);
		
		initial
			begin
				we = 0;
				D = 0;
				clk = 0;
				addr = 0;
			end
			
		always
			begin
				#20ns
				clk = ~clk;
			end
			
		always
			begin
				#40ns
				we = 1;
				D = 16'd8;
				addr = 2;
				#40ns
				we = 0;
				addr = 5;
			end

endmodule
