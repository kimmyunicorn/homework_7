/*
 * Copyright (c) 2026 Kimberly Camanero
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module full_add (
    input wire [3:0] a_i,
    input wire [3:0] b_i,
    input wire carry_i,
    output wire carry_o,
    output wire [3:0] sum_o
);
    wire [4:0] result;
    assign result = {1'b0, a_i} + {1'b0, b_i} + {4'b0, carry_i};
    assign sum_o = result[3:0];
    assign carry_o = result[4];


endmodule

module tt_um_example (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);
    wire [3:0] sum;
    wire carry_out;

    full_add kimmys_adder(
        .a_i(ui_in[3:0]),
        .b_i(uio_in[3:0]),
        .carry_i(ui_in[4]),
        .sum_o(sum),
        .carry_o(carry_out)
    );

    assign uo_out = {3'b0, carry_out, sum};
    assign uio_out = 0;
    assign uio_oe = 0;

    wire _unused = &{ena, clk, rst_n, ui_in[7:5], uio_in[7:4], 1'b0};
endmodule
