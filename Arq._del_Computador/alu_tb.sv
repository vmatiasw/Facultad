`timescale 1ns / 10ps

module alu_tb();
	logic [63:0] a, b, result;
	logic [3:0] ALUControl;
	logic zero;
	
   localparam NUMERO_UNO = 64'h0000000000000001; // 1
	localparam NUMERO_RANDOM = {$random, $random};
   localparam NUMERO_MENOS_UNO = 64'hffffffffffffffff; // -1
	localparam NUMERO_x2_OVERFLOW = 64'h8000000000000000;
	
	localparam ALU_AND = 4'b0000;
	localparam ALU_OR  = 4'b0001;
	localparam ALU_ADD = 4'b0010;
	localparam ALU_SUB = 4'b0110;
	localparam ALU_PASS_B = 4'b0111;

	 alu dut (
        .a(a),
        .b(b),
        .ALUControl(ALUControl),
        .result(result),
        .zero(zero)
    );
	 
	 initial begin		// bloque de prueba
		a = {64{1'bx}};
		b = {64{1'bx}};
		ALUControl = {4{1'bx}};

		//-----------------------(Test AND 1)
		// Dos positivos
		#1;
		a = NUMERO_UNO;
		b = NUMERO_UNO;
		ALUControl = ALU_AND;
		#1;
		assert (zero === 1'b0) else $error("Test AND 1.1:  zero !== 1'b0");
		assert (result === a && result === b) else $error("Test AND 1.1:  result === a && result === b");
		
		//-----------------------(Test AND 2)
		// Dos negativos
		#1;
		a = NUMERO_MENOS_UNO;
		b = NUMERO_MENOS_UNO;
		ALUControl = ALU_AND;
		#1;
		assert (result === NUMERO_MENOS_UNO) else $error("Test AND 2: result !== NUMERO_MENOS_UNO");
		assert (zero === 1'b0) else $error("Test AND 2: zero !== 1'b0");
		
		//-----------------------(Test AND 3)
		// Uno positivo y otro negativo
		#1;
		a = NUMERO_UNO;
		b = NUMERO_MENOS_UNO;
		ALUControl = ALU_AND;
		#1;
		assert (result === NUMERO_UNO) else $error("Test AND 3: result !== NUMERO_UNO");
		assert (zero === 1'b0) else $error("Test AND 3: zero !== 1'b0");
		//-----------------------(Test AND 4)
		// Overflow
		// No se puede hacer con AND
		
		//-----------------------(Test AND 5)
		// zero === 0
		
		#1;
		a = NUMERO_RANDOM;
		b = {64{1'b0}};
		ALUControl = ALU_AND;
		#1;
		assert (zero === 1'b1) else $error("Test AND 5:  zero !== 1'b1");
		assert (result === {64{1'b0}}) else $error("Test AND 5:  result !== {64{1'b0}}");
	
	
		//-----------------------(Test OR 1)
		// Dos positivos
		#1;
		a = {$ramdom, {32{1'b0}}};
		b = NUMERO_UNO;
		ALUControl = ALU_AND;
		#1;
		assert (result === {$ramdom, {{31{1'b0}}}, 1'b1}) else $error("Test OR 1:  zero !== 1'b0");
		assert (zero === 1'b0) else $error("Test OR 1:  zero !== 1'b0");
		
		//-----------------------(Test OR 2)
		// Dos negativos
		
		//-----------------------(Test OR 3)
		// Uno positivo y otro negativo

		//-----------------------(Test OR 4)
		// Overflow
		// No se puede hacer con AND
		
		//-----------------------(Test OR 5)
		// zero === 0
		
	 end
endmodule

//		$display("%b",a);
//		$display("%b",b);
//		$display("%b",result);
//		$display("%b",zero);
		
