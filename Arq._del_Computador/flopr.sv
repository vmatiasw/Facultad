module flopr#(
    parameter N = 64  // Tamaño predeterminado del registro
)(
	input logic clk,
	input logic reset,
	input logic [N-1:0] d,
	output logic [N-1:0] q);
	// El bloque always_ff se activará tanto en el flanco de subida de clk 
	// como en el flanco de subida de reset <-- reset asíncrono.
	// PD: un reset síncrono solo se activaria en el flanco de subida de clk. 
	always_ff @(posedge clk or posedge reset) begin
		if (reset) q <= '0; // reset activo por alto (1) de la salida Q a 0´s.
		else q <= d;
	end
endmodule