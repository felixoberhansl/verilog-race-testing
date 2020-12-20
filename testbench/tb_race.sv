`timescale 1ns / 1ps


`define REF_CLK_PERIOD   (2*15.25us)  // 32.786 kHz --> FLL reset value --> 50 MHz

module tb_race();

    logic clk;
    logic rst;
    logic [7:0] in_value = 8'h00;
    logic [7:0] out_slice;
    logic [7:0] out_a;
    logic [7:0] out_b;    

    /// DUT ///
    top dut(
        .clk(clk),
        .rst(rst),
        .in(in_value),
        .out_slice(out_slice),
        .out_a(out_a),
        .out_b(out_b)        
    );
    

    /// CLK GENERATION ///
    always  
    begin
        // clk generation
        clk = 1'b1;
        #(`REF_CLK_PERIOD/2);
        clk = 1'b0;
        #(`REF_CLK_PERIOD/2);
    end

    /// TEST STIMULI ///
    always @(posedge clk)
    begin    
        
        rst <= 1;        
        #(`REF_CLK_PERIOD);        
        rst <= 0;          
        #(`REF_CLK_PERIOD);
        in_value <= 8'h02;
        #(`REF_CLK_PERIOD);
        #(`REF_CLK_PERIOD);
        #(`REF_CLK_PERIOD);
        #(`REF_CLK_PERIOD);
    end
    
endmodule
