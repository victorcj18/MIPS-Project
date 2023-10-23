module cu (
						input logic [5:0]op,
						input logic [5:0]func,
						output logic [3:0] alu_op,
						output logic alu_a_sel,
						output logic rf_we = 1);
						
always_ff @(op,func,rf_we)
begin
	if (op==6'd0)
		begin
			case (func)
			6'd8: 
			begin
				alu_op<=4'd8;
				alu_a_sel<=1;
			end 
			6'd9:
			begin
				alu_op<=4'd9;
				alu_a_sel<=1;	
			end
			6'd10:
			begin
				alu_op<=4'd10;
				alu_a_sel<=1;
			end
			6'd11:
			begin
				alu_op<=4'd11;
				alu_a_sel<=1;
			end
			6'd12:alu_op<=4'd12;
			6'd13:alu_op<=4'd13;
			6'd14:
			begin
				alu_op<=4'd14;
				rf_we <= 0;
			end
			default:
				begin
				alu_op <= func;
				rf_we <= 1;
				end
				
			endcase
			
			if (func < 6'd8 || func > 6'd11)
				alu_a_sel<=0;
			else
			begin
				alu_a_sel<=1;
			end
			
			if (alu_op != 4'd14)
				rf_we <= 1;
			
		end
	end	
endmodule
