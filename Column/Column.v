module Column(clock, user_input, reset_signal, ypos, game_over, correct, letter);
    input clock;
    input [7:0] user_input;
    input reset_signal;

    output reg [4:0] ypos;
    output game_over;
    output correct;
    output reg [7:0] letter;

    assign correct = user_input == letter ? 1'b1 : 1'b0;
    assign game_over = ypos == 5'd22 ? 1'b1 : 1'b0;

    wire reset;
    assign reset = correct | reset_signal;

    wire reset;

    assign reset = reset_signal | correct;

    reg [25:0] fall_clock;
    reg [7:0] random_letter;

    initial begin
        fall_clock <= 26'd0;
        ypos <= 5'd0;
    end

    always @ (posedge clock or posedge reset) begin

        random_letter = random_letter + 8'd1;

        if (reset) begin
            ypos = 5'd23;
            fall_clock = 26'd0;
            letter = random_letter;
        end else begin

            if (ypos == 5'd23) begin
                ypos = 0;
            end

            if (fall_clock >= 26'd50000000) begin
                fall_clock = 26'd0;

                if (ypos < 5'd22) begin
                    ypos = ypos + 5'd1;
                end
            end else begin
                fall_clock = fall_clock + 26'd1;
            end
        end
    end
endmodule


