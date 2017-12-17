
module Reset_Flow(clock, reset_in, reset_out);
    input reset_in;
    output reg reset_out;

    reg [28:0] count;

    always @ (posedge reset_in or negedge reset_in or clock) begin
        reset_out <= reset_in;

        always @ (negedge reset_in) begin

            always @ (clock) begin
                if (count < 29'd500000000) begin
                    count <= count + 29'd1;
                end
                else begin
                    reset_out <= 1'd0;
                    count <= 1'd0;
                end
            end
        end
	end


endmodule

/* count <= count + 28'd1;
		if (count >= 29'd500000000) begin
			 count <= 28'd0;
		end 
		reset_out <= (count > 29'd500000000) ? 1'b1 : 1'b0;
*/