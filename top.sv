
module top #() (
    input logic clk,
    input logic rst,
    input logic [7:0] in,
    output logic [7:0] out_slice,
    output logic [7:0] out_a,
    output logic [7:0]out_b
    );

    logic enable = 1'b1;
    logic [7:0] slice_to_ff;
    logic [7:0] ff_a_to_b;
    
    comp_slice #(.PARAM_WIDTH(8)) slice (
        .clk(clk),
        .in(in),
        .out(slice_to_ff)
    );
    

    ff #(.PARAM_WIDTH(8)) ff_a (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .d(slice_to_ff),
        .q(ff_a_to_b)
    );
    
    ff #(.PARAM_WIDTH(8)) ff_b (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .d(ff_a_to_b),
        .q(out_b)
    );
    
    assign out_slice = slice_to_ff;
    assign out_a = ff_a_to_b;
       
        
endmodule