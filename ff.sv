
module ff #(parameter PARAM_WIDTH = 8) (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic [PARAM_WIDTH-1:0] d,
    output logic [PARAM_WIDTH-1:0] q
    );
    
    always_ff @(posedge clk, posedge rst)
    begin
        if (rst == 1) begin
            q <= 0;
        end else begin
            if (enable == 1) begin
                q <= d;
            end
        end
    end
    
endmodule
