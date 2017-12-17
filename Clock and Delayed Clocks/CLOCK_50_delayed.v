module CLOCK_50_delayed(clock_50, reset_button, game_over2, game_over3, clock_delay_30, clock_delay_60);
    input clock_50;
    input reset_button, game_over2, game_over3;
    output reg clock_delay_30, clock_delay_60;
    
    always @ (reset_button or game_over2) begin 
        // Wait for 30 clock cycles
        repeat (30) begin
            @ (posedge clock_50);
        end
        clock_delay_30 = clock_50;
    end
    
    always @ (reset_button or game_over3) begin 
        // Wait for 60 clock cycles
        repeat (60) begin
            @ (posedge clock_50);
        end
        clock_delay_60 = clock_50;
    end
    
endmodule 
    