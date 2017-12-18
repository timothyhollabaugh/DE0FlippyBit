module Column(clock, user_input, reset_signal, ypos, game_over, correct, letter);
    input clock;
    input [7:0] user_input;
    input reset_signal;

    output reg [4:0] ypos;
    output reg game_over;
    output reg correct;
    output reg [7:0] letter;

    reg [25:0] fall_clock;
    reg [7:0] random_letter;

    initial begin
        fall_clock <= 26'd0;
        ypos <= 5'd0;
        random_letter <= 8'b0;
    end

    always @ (posedge clock) begin
        random_letter <= random_letter + 8'd1;
    end

    always @ (posedge clock or posedge reset_signal) begin
        if (reset_signal) begin
            letter = random_letter;
            correct = 1'b0;
            game_over = 1'b0;
            ypos = 5'd23;
            fall_clock = 26'd0;
        end else begin

            if (user_input == letter) begin
                correct = 1'b1;
            end

            if (ypos == 5'd23) begin
                ypos = 0;
            end

            if (fall_clock >= 26'd50000000) begin
                fall_clock = 26'd0;

                if (ypos < 5'd22) begin
                    ypos = ypos + 5'd1;
                end else begin
                    game_over = 1'b1;
                end
            end else begin
                fall_clock = fall_clock + 26'd1;
            end
        end
    end
endmodule


