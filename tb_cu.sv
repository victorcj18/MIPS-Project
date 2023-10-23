module tb_cu;

		logic [5:0]op;
		logic [5:0]func;
		logic [3:0] alu_op;
		logic alu_a_sel;
		logic rf_we;
		
		cu CU0 (.*);
		
		int i = 0;
		
		initial
			begin
				op = 6'd0;
				func = 6'd7;
			end
endmodule
