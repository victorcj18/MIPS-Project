module tb_sign_extender;

		logic [4:0] instr;
      logic  [15:0] instr_out;
		
	
		sign_extender SE(
		instr, instr_out
		);
		
		always 
		begin 
		instr=5'b11100; //4 negativo
		#25ns;
		instr=5'b00100; //4 positivo
		#25ns;
		end 
		
endmodule
