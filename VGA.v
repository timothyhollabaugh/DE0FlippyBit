module VGA_Test(clk, data, red_out, green_out, blue_out, h_sync_out, v_sync_out, h_position, v_position, pixel_position, out);

    input clk;
    input [1200:0] data;
    output [3:0] red_out, green_out, blue_out;
    output reg h_sync_out, v_sync_out, out;

    // Sync signals looks like this
    //
    // ------\   /--------------------------------------\   /-----------------
    // H_SYNC|   |                                      |   |
    //       \---/                                      \---/
    //                  /----------------------\                    /---------
    // Data             |                      |                    |
    // -----------------+----------------------+--------------------+---------
    //       |===|======|======================|========|===|=======|=========
    //       Sync  Back |   Display Interval     Front  Sync  Back  |Display
    //             porch|                        porch        porch |Interval
    //==================|===========================================|=========
    //Prev. Line                  Current Line                       Next Line

    // Timing for horizontal sync in 50MHz cycles
    //parameter H_DISPLAY_INTERVAL = 1270; // 25.4us
    //parameter H_FRONT_PORCH = 30; // 0.6us
    //parameter H_SYNC = 190; // 2.8us
    //parameter H_BACK_PORCH = 95; // 1.9us

    parameter H_DISPLAY_INTERVAL = 640; // 25.4us
    parameter H_FRONT_PORCH = 16; // 0.6us
    parameter H_SYNC = 96; // 2.8us
    parameter H_BACK_PORCH = 48; // 1.9us

    // Timing for vertical sync in lines
    parameter V_DISPLAY_INTERVAL = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC = 2;
    parameter V_BACK_PORCH = 33;

    reg pixel_clock;
    output reg [11:0] h_position;
    output reg [10:0] v_position;

    reg h_pixel_enable;
    reg v_pixel_enable;

    // Max at 1200
    output [10:0] pixel_position;

    assign pixel_position = (h_position >> 4) + ((v_position >> 4) * 40);

    initial begin
        //red_out <= 4'b0000;
        //green_out <= 4'b0000;
        //blue_out <= 4'b0000;
        h_sync_out <= 1'b1;
        v_sync_out <= 1'b1;
        pixel_clock <= 1'b0;
        h_position <= 11'd0;
        v_position <= 10'd0;
        h_pixel_enable <= 1'b0;
        v_pixel_enable <= 1'b0;
    end

    // 25MHz Pixel clock
    always @(posedge clk) begin
        pixel_clock <= ~pixel_clock;
    end

    // Horizontal sync
    always @(posedge pixel_clock) begin
        if (h_position < H_DISPLAY_INTERVAL) begin
            h_sync_out <= 1'b1;
            h_pixel_enable <= 1'b1;
            h_position <= h_position + 1'b1;
        end else if (h_position < H_DISPLAY_INTERVAL + H_FRONT_PORCH) begin
            h_sync_out <= 1'b1;
            h_pixel_enable <= 1'b0;
            h_position <= h_position + 1'b1;
        end else if (h_position < H_DISPLAY_INTERVAL + H_FRONT_PORCH + H_SYNC) begin
            h_sync_out <= 1'b0;
            h_pixel_enable <= 1'b0;
            h_position <= h_position + 1'b1;
        end else if (h_position < H_DISPLAY_INTERVAL + H_FRONT_PORCH + H_SYNC + H_BACK_PORCH) begin
            h_sync_out <= 1'b1;
            h_pixel_enable <= 1'b0;
            h_position <= h_position + 1'b1;
        end else begin
            h_position <= 1'b0;
        end
    end

    // Vertical sync
    always @(posedge h_sync_out) begin
        if (v_position < V_DISPLAY_INTERVAL) begin
            v_sync_out <= 1'b1;
            v_pixel_enable <= 1'b1;
            v_position <= v_position + 1'b1;
        end else if (v_position < V_DISPLAY_INTERVAL + V_FRONT_PORCH) begin
            v_sync_out <= 1'b1;
            v_pixel_enable <= 1'b0;
            v_position <= v_position + 1'b1;
        end else if (v_position < V_DISPLAY_INTERVAL + V_FRONT_PORCH + V_SYNC) begin
            v_sync_out <= 1'b0;
            v_pixel_enable <= 1'b0;
            v_position <= v_position + 1'b1;
        end else if (v_position < V_DISPLAY_INTERVAL + V_FRONT_PORCH + V_SYNC + V_BACK_PORCH) begin
            v_sync_out <= 1'b1;
            v_pixel_enable <= 1'b0;
            v_position <= v_position + 1'b1;
        end else begin
            v_position <= 1'b0;
        end
    end

    // Pixel color outputs
    assign red_out[3] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign red_out[2] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign red_out[1] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign red_out[0] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign green_out[3] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign green_out[2] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign green_out[1] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign green_out[0] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign blue_out[3] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign blue_out[2] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign blue_out[1] = h_pixel_enable & v_pixel_enable & data[pixel_position];
    assign blue_out[0] = h_pixel_enable & v_pixel_enable & data[pixel_position];

endmodule

