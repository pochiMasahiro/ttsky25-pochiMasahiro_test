/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_pochiMasahiro_test (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7], ui_in[6], ui_in[5], ui_in[4], ui_in[3], ui_in[2], ui_in[1], ui_in[0], uo_out[7], uo_out[6], uo_out[5], 1'b0};

  wire [3:0] d;
  assign uo_out[3:0] = d;

  reg [3:0] count;

  always @(posedge clk or negedge rst_n)
  begin
      if (!rst_n)
          count <= 4'b0;
      else
          count <= count + 4'b1;
  end

  assign d = count;

endmodule
