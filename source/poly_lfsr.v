//
module poly_lfsr #(
    parameter WIDTH = 32,
    parameter POLY  = 8
)(
    input logic clk,
    input logic reset,
    output logic [POLY-1:0][WIDTH-1:0] q
);

    logic [POLY:0][WIDTH-1:0] data;
    genvar i;
    generate for(i=0; i<POLY; i++) begin
        lfsr #(.WIDTH(WIDTH)) uut (.datain(data[i]), .dataout(data[i+1]));
    end endgenerate

    always_ff @(posedge clk) if (reset==1) data[0] <= {WIDTH{1'b1}}; else data[0] <= data[POLY];
  
    generate for(i=0; i<POLY; i++) always_ff @(posedge clk) q[i] <= data[i]; endgenerate

endmodule
