// Reset Flow module for 10 seconds delay

module Reset_Flow(clock, reset_in, reset_out);
    input clock;
    input [2:0] reset_in;
    output reg [2:0] reset_out;

    reg [31:0] count;
    reg first_time;

    always @(posedge clock) begin
        if (reset_in[0] & reset_in[1] & reset_in[2]) begin
            count = 1'd0;
            reset_out = 3'b111;
        end else begin

            if (count <= 32'd500000000) begin
                count = count + 32'd1;
            end

            if (count >= 32'd5000000) begin
                reset_out[1] = reset_in[1];
            end

            if (count >= 32'd251231231) begin
                reset_out[0] = reset_in[0];
            end

            if (count >= 32'd498798797) begin
                reset_out[2] = reset_in[2];
            end
        end
    end
endmodule 
