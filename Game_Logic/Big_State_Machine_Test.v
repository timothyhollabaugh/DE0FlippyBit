module Big_State_Machine_Test ();
    reg [2:0]game_over, correct;
    reg reset_button;
    reg clock;
    wire [2:0] reset_signal;
    wire [7:0]score;
    wire [2:0] state;


    Big_State_Machine dut (reset_button, game_over, correct, reset_signal, score, clock, state);

    initial begin
        game_over <= 3'b000;
        correct <= 3'b000;
        reset_button <= 1'b1;
        clock <= 1'b0;
    end

    always begin
        #10
        clock <= ~clock;
    end

    always begin
        #100
        reset_button <= 1'b0;
        #100
        game_over <= 3'b001;
        #100
        game_over <= 3'b000;
        #100
        game_over <= 3'b010;
        #100
        game_over <= 3'b000;
        #100
        game_over <= 3'b100;
        #100
        game_over <= 3'b000;

        #100
        correct <= 3'b001;
        #100
        correct <= 3'b000;
        #100
        correct <= 3'b010;
        #100
        correct <= 3'b000;
        #100
        correct <= 3'b100;
        #100
        correct <= 3'b000;
    end

    initial begin
        #20000
        $stop;
    end
endmodule
