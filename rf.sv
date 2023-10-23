module rf #(
		parameter RF_ADDRESS_WIDTH=5, 
		parameter DATA_WIDTH=16)
		(
		input logic clk,
		input logic asyn_n_rst,
		input logic we,
		input logic [RF_ADDRESS_WIDTH-1:0] rs1, 
		input logic [RF_ADDRESS_WIDTH-1:0] rs2,
		input logic [RF_ADDRESS_WIDTH-1:0] rd,
		input logic [DATA_WIDTH-1:0] data_in,
		output logic [DATA_WIDTH-1:0] Qs1,
		output logic [DATA_WIDTH-1:0] Qs2);

reg [31:0][DATA_WIDTH-1:0] register={32{16'b0}};


always_ff @(posedge clk, negedge asyn_n_rst)
	begin
		if (~asyn_n_rst)
			begin 
				for (int i = 0; i<RF_ADDRESS_WIDTH; i++)
					begin
						register[i] = 16'b0;
					end
			end 
		else 
			begin
				if(we==1'b1)
					begin
						register[rd]<=data_in;
					end
				else 
					begin
						Qs1<=register[rs1];
						Qs2<=register[rs2];
					end 
			end 		
end
endmodule 