`timescale 1ns / 1ps
module systolic_array_2x2 (
    input  logic clk, rst_n, clear_acc, en,
    input  logic signed [7:0] row0_in, row1_in, col0_in, col1_in,
    output logic signed [31:0] c00, c01, c10, c11
);
    logic signed [7:0] a00_01, a10_11, b00_10, b01_11, u1, u2, u3, u4;
    pe_mac_int8 pe00 (.clk(clk), .rst_n(rst_n), .clear_acc(clear_acc), .en(en), .in_act(row0_in), .in_wgt(col0_in), .out_act(a00_01), .out_wgt(b00_10), .acc_out(c00));
    pe_mac_int8 pe01 (.clk(clk), .rst_n(rst_n), .clear_acc(clear_acc), .en(en), .in_act(a00_01),  .in_wgt(col1_in), .out_act(u1),     .out_wgt(b01_11), .acc_out(c01));
    pe_mac_int8 pe10 (.clk(clk), .rst_n(rst_n), .clear_acc(clear_acc), .en(en), .in_act(row1_in), .in_wgt(b00_10),  .out_act(a10_11), .out_wgt(u2),     .acc_out(c10));
    pe_mac_int8 pe11 (.clk(clk), .rst_n(rst_n), .clear_acc(clear_acc), .en(en), .in_act(a10_11),  .in_wgt(b01_11),  .out_act(u3),     .out_wgt(u4),     .acc_out(c11));
endmodule
