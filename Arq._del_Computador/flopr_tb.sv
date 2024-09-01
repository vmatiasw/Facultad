`timescale 1ns / 10ps

module flopr_tb();
    parameter N = 32;

    logic clk;
    logic reset;
    logic [N-1:0] d;
    logic [N-1:0] q;
    logic [31:0] count, errors;
    logic [N-1:0] Nnumbers [0:9];
    
    flopr #(N) dut ( // Instanciación del módulo `flopr` que se va a probar
        .clk(clk), 
        .reset(reset), 
        .d(d), 
        .q(q)
    );
    
    initial begin // inicialización y vida del testbench
        count = 0; errors = 0;
        for (int i = 0; i < 10; i = i + 1) begin
            Nnumbers[i] = $random;
		  end
        reset = 1;
        #50ns;
        reset = 0;
    end
    
    always begin // generación del reloj
        clk = 1; #5ns; clk = 0; #5ns; // alterna entre 1 y 0 con periodo de 10 ns
    end    

    always @(posedge clk) begin // bloque de prueba
	 
		  d = Nnumbers[count];
    
        if (count > 9) // finalización
        begin
            $display("Se detectaron %d errores entre %d tests de flopr", errors, count);
            $stop;
        end
        
        #1ns; //------------------( espera para la propagación de señales )
        
        if (reset === 1) begin // revisamos que no de error los primeros [0...4] casos
            if (q !== {N{1'b0}}) begin
                $display("El caso %d FALLO (q !== %d'b0)", count, N);
                errors = errors + 1;
            end
        end
        
        if (reset === 0) begin // revisamos que no de error los casos [5...9]
            if (q !== Nnumbers[count-1]) begin
                $display("El caso %d FALLO (q !== Nnumbers[count-1])", count);
                errors = errors + 1;
            end
        end
        
        #1ns; //------------------( espera para la propagación de señales )
        
        count = count + 1;
    
    end
endmodule