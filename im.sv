module im #(
		parameter IM_ADDRESS_WIDTH = 6,		// log2(64)
		parameter INSTRUCTION_WIDTH = 32
)(
		input logic [IM_ADDRESS_WIDTH-1:0] addr,
		output logic [INSTRUCTION_WIDTH-1:0] Q
);

	reg [0:IM_ADDRESS_WIDTH-1] [INSTRUCTION_WIDTH-1:0]InstMem;
	
	initial
		begin
			InstMem[0] = 32'h00A62020;
			InstMem[1] = 32'h00A62022;
			InstMem[2] = 32'h00A62023;
			InstMem[3] = 32'h20E8FFF6;
			InstMem[4] = 32'h28E8FFFE;
			InstMem[5] = 32'h01063824;
		end
	
	always_ff @(addr)
		begin
			Q <= InstMem[addr];
		end

endmodule
