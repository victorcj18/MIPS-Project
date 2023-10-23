module alu #(parameter DATA_WIDTH=16)(
				input logic signed [DATA_WIDTH-1:0] a,
				input logic signed [DATA_WIDTH-1:0] b, 
				input logic [4:0]op, 
				output logic signed [DATA_WIDTH-1:0]result,
				output logic zero,
				output logic neg,
				output logic grt,
				output logic eq); 

enum {
		ALU_ADD,
		ALU_SUB, 
		ALU_NAND,
		ALU_NOR,
		ALU_XNOR,
		ALU_AND,
		ALU_OR,
		ALU_XOR,
		ALU_SLL,
		ALU_SRL,
		ALU_SLA,
		ALU_SRA,
		ALU_LUI,
		ALU_LLI,
		ALU_CMP} operations;
		
always_comb
	begin
		case(op)
			ALU_ADD: result=a+b;
			ALU_SUB: result=a-b;
			ALU_NAND: result= ~(a & b);
			ALU_NOR: result= ~(a | b);
			ALU_XNOR: result= ~(a ^ b);
			ALU_AND: result= a & b;
			ALU_OR: result= a | b;
			ALU_XOR: result= a ^ b;
			ALU_SLL: result= a << b;
			ALU_SRL: result= a >> b;
			ALU_SLA: result= a <<< b;
			ALU_SRA: result= a >>> b;
			ALU_LUI: result= {b[7:0],8'b0};
			ALU_LLI: result= {8'b0, b[7:0]};
			ALU_CMP: result= 0;
			default: result=1;
		endcase

	end
always_comb 
	 begin
			if(a>b) 
				grt=1; 	
			else 
				grt=0;
				
			if (result==0)
				zero=1;
			else 
				zero=0;
				
			if (a==b)
				eq=1;
			else 
				eq=0;
				
			if (result[DATA_WIDTH-1]==1)
				neg=1;
			else 
				neg=0;		
	 end
endmodule 
			