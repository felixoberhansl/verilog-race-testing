

module comp_slice #(parameter PARAM_WIDTH = 8) (
        input logic clk,
        input logic [PARAM_WIDTH-1:0] in,
        output logic [PARAM_WIDTH-1:0] out
    );
    
    logic[PARAM_WIDTH-1:0] mul_res;
    
    always_ff @(posedge clk)
    begin
        mul_res <= in * 2;
    end
    
    always_comb
    begin
        out = mul_res + 7;    
    end
    
endmodule
