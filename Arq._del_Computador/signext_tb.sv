`timescale 1ns / 10ps

module signext_tb();
	logic [31:0] a;
	logic [63:0] y;
	
	logic clk;
	logic [3:0] count;

	 signext dut (
        .a(a), 
        .y(y)
    );
	 
	 initial begin
		count = 0;
		a = '0;
	 end
	 
	 always begin // generación del reloj
        clk = 1; #5ns; clk = 0; #5ns; // alterna entre 1 y 0 con periodo de 10 ns
    end    

    always @(posedge clk) begin // bloque de prueba
		case (count)
			4'b0000: begin 
							a = {11'b111_1100_0010, {1'b0,{20{1'b1}}}}; // LDUR
							#1;
							assert (y[63:9] === {55{1'b0}} && y[8:0] === {1'b0, {8{1'b1}}}) else $error("Error test 0 LDUR");
						end
			4'b0001: begin 
							a = {11'b111_1100_0000, {1'b0,{20{1'b1}}}}; // STUR
							#1;
							assert (y[63:9] === {55{1'b0}} && y[8:0] === {1'b0, {8{1'b1}}}) else $error("Error test 1 STUR");
						end
			4'b0010: begin 
							a = {8'b101_1010_0, {1'b0,{23{1'b1}}}}; //  CBZ 
							#1;
							assert (y[63:19] === {44{1'b0}} && y[18:0] === {1'b0, {18{1'b1}}}) else $error("Error test 2 CBZ");
						end
			4'b0011: begin 
							a = {11'b111_1100_0001, {21{1'b1}}}; // caso error
							#1;
							assert (y === {64{1'b0}}) else $error("Error test 3 caso error");
						end
			4'b0100: begin
							a = {11'b101_1110_0000, {21{1'b1}}}; // caso error
							#1;
							assert (y === {64{1'b0}}) else $error("Error test 4 caso error");
						end
			default: $stop;
		endcase
		count++;
	 end
endmodule