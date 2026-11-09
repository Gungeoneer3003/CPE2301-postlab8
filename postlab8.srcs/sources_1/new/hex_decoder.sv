`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2026 03:02:07 PM
// Design Name: 
// Module Name: hex_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Converts one hexadecimal nibble to active-low Basys3 segment signals
module hex_decoder (
   input  logic [3:0] hex_value,
   output logic [6:0] seg
);

       // seg[6:0] = {g, f, e, d, c, b, a}
       always_comb begin
           case (hex_value)
               4'h0: seg = 7'b1000000;
               4'h1: seg = 7'b1111001;
               4'h2: seg = 7'b0100100;
               4'h3: seg = 7'b0110000;
               4'h4: seg = 7'b0011001;
               4'h5: seg = 7'b0010010;
               4'h6: seg = 7'b0000010;
               4'h7: seg = 7'b1111000;
               4'h8: seg = 7'b0000000;
               4'h9: seg = 7'b0010000;
               4'hA: seg = 7'b0001000;
               4'hB: seg = 7'b0000011;
               4'hC: seg = 7'b1000110;
               4'hD: seg = 7'b0100001;
               4'hE: seg = 7'b0000110;
               4'hF: seg = 7'b0001110;
               default: seg = 7'b1111111;
           endcase
       end

   endmodule
