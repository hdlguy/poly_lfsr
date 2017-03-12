`timescale 1 ns / 1 ps

module poly_lfsr_tb();

    localparam WIDTH = 16;
    localparam POLY = 8;

    localparam clk_period = 10;
    logic   clk = 0;
    always #(clk_period/2) clk = ~clk;
  
    logic reset;
    initial begin
        reset = 1;
        #(clk_period*10);
        reset = 0;
     end
    
    logic [POLY-1:0][WIDTH-1:0] q;

    poly_lfsr #(.WIDTH(WIDTH), .POLY(POLY)) uut (.clk(clk), .reset(reset), .q(q));

endmodule
