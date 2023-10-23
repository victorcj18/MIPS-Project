module dm #(
		parameter DATA_WIDTH = 16,
		parameter DM_ADDRESS_WIDTH = 6
)(
		input logic clk,
		input logic we,
		input logic [DATA_WIDTH-1:0] D,
		input logic [DM_ADDRESS_WIDTH-1:0] addr,
		output logic [DATA_WIDTH-1:0] Q
);


	reg [DATA_WIDTH-1:0] register [0:DM_ADDRESS_WIDTH-1] = '{(DM_ADDRESS_WIDTH){'b0}};
	
	assign Q = register[addr];

	always_ff @(posedge clk)
		begin
			if (we == 1)
				begin
					register[addr] <= D;
				end
		end
	

endmodule
