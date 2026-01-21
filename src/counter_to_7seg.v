// Copyright 2025 Michael Pichler
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE−2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/*
	converts binary counter value to decimal 7-segment-display representation.
*/


`default_nettype none
`ifndef __COUNTER_to_7seg__
`define __COUNTER_to_7seg__


module counter_to_7seg (
    input  wire [3:0] count_i,     	// 4-bit counter input (0-9)
    output wire  [6:0] seg_o        // 7-segment output: {a,b,c,d,e,f,g}
);

  reg[6:0] seg;
    always @(*) begin
        case (count_i)
            4'd0: seg = 7'b0111111; // 0
            4'd1: seg = 7'b0000110; // 1
            4'd2: seg = 7'b1011011; // 2
            4'd3: seg = 7'b1001111; // 3
            4'd4: seg = 7'b1100110; // 4
            4'd5: seg = 7'b1101101; // 5
            4'd6: seg = 7'b1111101; // 6
            4'd7: seg = 7'b0000111; // 7
            4'd8: seg = 7'b1111111; // 8
            4'd9: seg = 7'b1101111; // 9

            default: seg = 7'b0000000; // blank/off
        endcase
    end

    assign seg_o = seg; 
endmodule

`endif
`default_nettype wire
