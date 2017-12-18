module Column_Testbench();
    reg clock;
    reg [7:0] user_input;
    reg reset_signal;

    wire [4:0] ypos;
    wire game_over;
    wire correct;
    wire [7:0] letter;

    Column dut (clock, user_input, reset_signal, ypos, game_over, correct, letter);

    initial begin
        clock <= 1'b0;
        user_input <= 8'd0;
        reset_signal <= 1'b0;
    end

    always begin
        #10
        clock <= ~clock;
    end

    always begin
        #10
        reset_signal <= 1'b1;
        #100
        reset_signal <= 1'b0;
        #300
        user_input <= letter;
        #100
        reset_signal <= 1'b1;
        #100
        reset_signal <= 1'b0;
        #100
        user_input <= letter;
        #100
        $stop;
    end

endmodule
