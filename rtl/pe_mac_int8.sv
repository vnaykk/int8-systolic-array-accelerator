`timescale 1ns / 1ps
module pe_mac_int8 (
    input  logic clk, rst_n, clear_acc, en,
    input  logic signed [7:0] in_act, in_wgt,
    output logic signed [7:0] out_act, out_wgt,
    output logic signed [31:0] acc_out
);
    logic signed [15:0] prod_16;
    assign prod_16 = in_act * in_wgt;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n || clear_acc) begin out_act <= '0; out_wgt <= '0; acc_out <= '0; end
        else if (en) begin out_act <= in_act; out_wgt <= in_wgt; acc_out <= acc_out + 32'(prod_16); end
    end
endmodule
