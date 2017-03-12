`timescale 1 ns / 1 ps

module lfsr_tb();

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
    

    logic [POLY:0][WIDTH-1:0] data;
    logic [POLY-1:0][WIDTH-1:0] q;
    genvar i;
    generate for(i=0; i<POLY; i++) begin
        lfsr #(.WIDTH(WIDTH)) uut (.datain(data[i]), .dataout(data[i+1]));
    end endgenerate

    always_ff @(posedge clk) if (reset==1) data[0] <= {WIDTH{1'b1}}; else data[0] <= data[POLY];
  
    generate for(i=0; i<POLY; i++) always_ff @(posedge clk) q[i] <= data[i]; endgenerate

endmodule
