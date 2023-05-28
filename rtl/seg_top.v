module seg_top(clk, RESET, count2, count_ACK2, seg_out, digit_select);

input clk, RESET, count2, count_ACK2;
output[6:0] seg_out;
output digit_select;

//wire clk_1hz;
//wire [7:0] qout;
//wire [3:0] qout1, qout2;
wire [3:0] qout2;

//assign qout = {qout1, qout2};


//down_counter DN (.clk(clk), .RESET(RESET), .count2(count2), .count_ACK2(count_ACK2), .cnt1(qout1), .cnt0(qout2));
Pmod_SSD SSD(.clk(clk), .reset(RESET), .value(qout2), .segments(seg_out), .digit_select(digit_select));
down_counter DN (.clk(clk), .count2(count2), .count_ACK2(count_ACK2), .RESET(RESET), .cnt0(qout2));
//clk_div CLK (clk, reset, clk_1hz);

endmodule