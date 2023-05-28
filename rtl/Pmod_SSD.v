module Pmod_SSD (clk, reset, value, segments, digit_select);

input clk;
//input [7:0] value;
input [3:0] value;
input reset;
output reg [6:0] segments;
//output reg digit_select;
reg [14:0] timer;
wire ce = timer[14:0] == 15'h0; 
//wire ce = timer[17:0] == 18'h0;

output wire digit_select;
assign digit_select = 1'b0;

//wire [3:0] curvalue = digit_select ? value[7:4] : value[3:0];
/*
always @(posedge clk) begin
    timer <= timer + 1;
    if (ce)
        digit_select <= ~digit_select;
        
    if (!reset) begin 
        timer <= 0;
        //digit_select <= 0;
    end
    
end
*/

always @(value) begin
    case (value[3:0])
            4'h0 : segments <= 7'b1111110;
            4'h1 : segments <= 7'b0110000;
            4'h2 : segments <= 7'b1101101;
            4'h3 : segments <= 7'b1111001;
            4'h4 : segments <= 7'b0110011;
            4'h5 : segments <= 7'b1011011;
            4'h6 : segments <= 7'b1011111;
            4'h7 : segments <= 7'b1110010;
            4'h8 : segments <= 7'b1111111;
            4'h9 : segments <= 7'b1111011;
            4'hA : segments <= 7'b0000000;
        //4'h0 : segments <= 7'b1111011;
        //4'h1 : segments <= 7'b0110000;
        //4'h2 : segments <= 7'b1011101;
        //4'h3 : segments <= 7'b1111100;
        //4'h4 : segments <= 7'b0110110;
        //4'h5 : segments <= 7'b1101110;
        //4'h6 : segments <= 7'b1101111;
        //4'h7 : segments <= 7'b0111000;
        //4'h8 : segments <= 7'b1111111;
        //4'h9 : segments <= 7'b1111110;
        //4'ha : segments <= 7'b0111111;
        //4'hb : segments <= 7'b1100111;
        //4'hc : segments <= 7'b1001011;
        //4'hd : segments <= 7'b1110101;
        //4'he : segments <= 7'b1001111;
        //4'hf : segments <= 7'b0001111;
    endcase    
end

endmodule
