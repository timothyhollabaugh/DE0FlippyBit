
//  Converting the DE0's internal reading of score from binary to decimal.

module Binary_BCD(binary, tens, ones);
    input [7:0] binary;
    output reg [3:0] tens;
    output reg [3:0] ones;

    // SR = Shifts Remaining 
    integer shift_remaining; 

    always @ (binary) begin
        // sets 10's and 1's to 0.
        tens = 4'd0;
        ones  = 4'd0;

        for (
                shift_remaining = 7; 
                shift_remaining >= 0; 
                shift_remaining = shift_remaining - 1
            ) begin
            // add 3 to columns >= 5
            if (tens >= 5) begin
                tens = tens + 3;
            end
            if (ones >= 5) begin
                ones = ones + 3;
            end
            // shift to the left one space
            tens = tens << 1;
            tens[0] = one[3];
            ones = ones << 1;
            ones = binary[shift_remaining];
        end
    end
endmodule
