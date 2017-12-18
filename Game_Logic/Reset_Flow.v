// Reset Flow module for 10 seconds delay

module Reset_Flow(clock, reset_in, reset_out);
    input clock;
    input [2:0] reset_in;
    output reg [2:0] reset_out;
 
    reg [26:0] count;
    reg first_time;

    always @(posedge clock) begin
        if (reset_in[0] & reset_in[1] & reset_in[2]) begin
            count = 1'd0;
        end else begin
            if (count < 27'd200000000) begin
                count <= count + 27'd1;
                reset_out[0] <= 1'b1;
            end
            else begin          
                reset_out[0] <= reset_in[0];
            end
            if (count < 27'd400000000) begin
                count <= count + 27'd1;
                reset_out[1] <= 1'b1;
            end
            else begin          
                reset_out[1] <= reset_in[1];
            end
            if (count < 27'd800000000) begin
                count <= count + 27'd1;
                reset_out[2] <= 1'b1;
            end
            else begin          
                reset_out[2] <= reset_in[2];
            end
        end
    end
endmodule 
