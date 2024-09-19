/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_HSMinches (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
     
    assign uo_out = ui_in + uio_in;

    assign uio_oe = 0;
    assign uio_out = 0;
    
    
    
    always@(posedge clk) 
     if (rst_n) begin 
      uio_out<= 8'b0;
     end else if (ena) begin 
      uio_out<= uio_out+1;
    end


endmodule
