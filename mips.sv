module mips #(
		// im
		parameter IM_ADDRESS_WIDTH = 6,
		parameter INSTRUCTION_WIDTH = 32,
		// rf
		parameter RF_ADDRESS_WIDTH=5, 
		parameter DATA_WIDTH=16 // works with alu.

)

(
		// im
		input logic [IM_ADDRESS_WIDTH-1:0] addr,
		output logic [INSTRUCTION_WIDTH-1:0] Q,
		// rf
		input logic clk,
		input logic asyn_n_rst,
		output logic [DATA_WIDTH-1:0] result = 0

);


	//		INSTRUCTION MEMORY.
	
	im #(
			.IM_ADDRESS_WIDTH(IM_ADDRESS_WIDTH),
			.INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)
	) IM0 (
			.addr(addr),
			.Q(Q)
	);
	
	
	
	//   REGISTER FILE.
	
	logic [DATA_WIDTH-1:0] Qs1;
	logic [DATA_WIDTH-1:0] Qs2;
	logic rf_we;
	
	rf #(
			.RF_ADDRESS_WIDTH(RF_ADDRESS_WIDTH),
			.DATA_WIDTH(DATA_WIDTH)
	) RF0 (
			.clk(clk),
			.asyn_n_rst(asyn_n_rst),
			.we(rf_we),
			.rs1(Q[25:21]),
			.rs2(Q[20:16]),
			.rd(Q[15:11]),
			.data_in(result),
			.Qs1(Qs1),
			.Qs2(Qs2)
	);

	
	//   SIGN EXTEND.
	
	logic [15:0] instr_out;
	
	se SE1 (
			.instr(Q[10:6]),
			.instr_out(instr_out)
	);
	
	
	//   CONTROL UNIT.
	
	logic [3:0] alu_op;
	logic alu_a_sel;
	
	cu CU0 (
			.op(Q[31:26]),
			.func(Q[5:0]),
			.alu_op(alu_op),
			.alu_a_sel(alu_a_sel),
			.rf_we(rf_we)
	);
	
	
	//   ALU
	
	logic zero;
	logic neg;
	logic grt;
	logic eq;
	logic [DATA_WIDTH-1:0] a;
	
	alu #(
			.DATA_WIDTH(DATA_WIDTH)
	) ALU0 (
			.a(a),
			.b(Qs2),
			.op(alu_op),
			.result(result),
			.zero(zero),
			.neg(neg),
			.grt(grt),
			.eq(eq)
	);
	
	assign a = (alu_a_sel == 1) ? instr_out : Qs1;
	
endmodule
