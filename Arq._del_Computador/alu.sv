module alu(
	input logic [63:0] a, b,
	input logic [3:0] ALUControl, 
	output logic zero,
	output logic [63:0] result);
	
	always_comb begin
		unique casez(ALUControl)
			4'b0000: result = a & b; // AND bit a bit
			4'b0001: result = a | b; // OR bit a bit
			4'b0010: result = a + b; // ADD
			4'b0110: result = a - b; // SUB
			4'b0111: result = b;     // PASS INPUT b
			default: result = {64{1'bx}};
		endcase
		zero = (result === {64{1'b0}}) ? 1 : 0;
	end
endmodule