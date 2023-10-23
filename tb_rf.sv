module tb_rf;

		parameter RF_ADDRESS_WIDTH=5;
		parameter DATA_WIDTH=16;
		
		logic clk;
		logic asyn_n_rst;
		logic we;
		logic [RF_ADDRESS_WIDTH-1:0] rs1;
		logic [RF_ADDRESS_WIDTH-1:0] rs2;
		logic [RF_ADDRESS_WIDTH-1:0] rd;
		logic [DATA_WIDTH-1:0] data_in;
		logic [DATA_WIDTH-1:0] Qs1;
		logic [DATA_WIDTH-1:0] Qs2;
		
		rf #(
				.RF_ADDRESS_WIDTH(RF_ADDRESS_WIDTH),
				.DATA_WIDTH(DATA_WIDTH)
		) RF0 (
				.clk(clk),
				.asyn_n_rst(asyn_n_rst),
				.we(we),
				.rs1(rs1),
				.rs2(rs2),
				.rd(rd),
				.data_in(data_in),
				.Qs1(Qs1),
				.Qs2(Qs2)
		);
		
		initial
			begin
				clk 			= 0;
				asyn_n_rst 	= 1;
				we 			= 0;
				rs1			= 0;
				rs2			= 0;
				rd				= 0;
				data_in		= 0;
			end
			
		always
			begin
				#20ns;
				clk = ~clk;
			end
			
		always
			begin
				we = 1;
				#100ns;
				for (int i = 0; 31 > i; i++)
					begin
						#40ns;
						data_in = i;
						rd = i;
					end
				we = 0;
				#100ns;
				for (int i = 0; 31 > i; i++)
					begin
						#40ns;
						rs1 = i;
						rs2 = i;
					end
					#40ns;
			end

endmodule
