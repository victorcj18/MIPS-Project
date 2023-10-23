module sign_extender (
input logic [4:0] instr,
output logic [15:0] instr_out
);

assign instr_out[4:0]=instr[4:0] ;
assign instr_out[15:5]=(instr[4]==1'b0)?11'b0:11'h7FF;	
endmodule
