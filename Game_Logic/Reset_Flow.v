// Reset Flow module for 10 seconds delay

module Reset_Flow(clock, reset_in, reset_out);
    input clock;
    input reset_in;
    output reg reset_out;
 
    reg [29:0] count;
    reg first_time;

    always @(posedge clock) begin
        if (~first_time) begin
            if (reset_in) begin
            count = 1'd0;
            end
            else begin
                count <= count + 30'd1;
                if (count < 30'd500000000) begin
                    reset_out <= 1'd1;
                end
                else begin          
                    reset_out <= 1'd0;                
                    first_time <= 1'd1;
                end 
            end
        end
        else begin
            reset_out <= reset_in;
        end
    end
endmodule 
