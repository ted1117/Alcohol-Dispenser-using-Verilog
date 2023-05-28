module top(
	input clk, RESET, load3, load2, load1, load0,
	output p0, p1, p2, p3, digit_select,
	output [6:0] seg_out
);


//wire count2, count_ACK2, out_ctrl;
wire count2_3, count2_2, count2_1, count2_0;
wire count_ACK2_3, count_ACK2_2, count_ACK2_1, count_ACK2_0;
wire out_ctrl0, out_ctrl1, out_ctrl2, out_ctrl3;
wire out3, out2, out1, out0;
wire load_n0, load_n1, load_n2, load_n3;
wire count2 = count2_0 || count2_1 || count2_2 || count2_3;
wire count_ACK2 = count_ACK2_0 || count_ACK2_1 || count_ACK2_2 || count_ACK2_3;

emit3 em3(.clk(clk), .RESET(RESET), .out_ctrl(out_ctrl3), .load3(load_n3), .count_ACK2(count_ACK2_3), .out3(out3), .count2(count2_3));
emit2 em2(.clk(clk), .RESET(RESET), .out_ctrl(out_ctrl2), .load2(load_n2), .count_ACK2(count_ACK2_2), .out2(out2), .count2(count2_2));
emit1 em1(.clk(clk), .RESET(RESET), .out_ctrl(out_ctrl1), .load1(load_n1), .count_ACK2(count_ACK2_1), .out1(out1), .count2(count2_1));
emit0 em0(.clk(clk), .RESET(RESET), .out_ctrl(out_ctrl0), .load0(load_n0), .count_ACK2(count_ACK2_0), .out0(out0), .count2(count2_0));

timer_1s time3(.clk(clk), .count2(count2_3), .count_ACK2(count_ACK2_3));
timer_1s time2(.clk(clk), .count2(count2_2), .count_ACK2(count_ACK2_2));
timer_1s time1(.clk(clk), .count2(count2_1), .count_ACK2(count_ACK2_1));
timer_1s time0(.clk(clk), .count2(count2_0), .count_ACK2(count_ACK2_0));

mainctrl mainc(.clk(clk), .RESET(RESET), .load0(load_n0), .load1(load_n1), .load2(load_n2), .load3(load_n3), .out0(out0), .out1(out1), .out2(out2), .out3(out3), .out_ctrl3(out_ctrl3), .out_ctrl2(out_ctrl2), .out_ctrl1(out_ctrl1), .out_ctrl0(out_ctrl0), .p0(p0), .p1(p1), .p2(p2), .p3(p3));

ledcontrol lc(.clk(clk), .i_switch1(load0), .i_switch2(load1), .i_switch3(load2), .i_switch4(load3), .RESET(RESET), .pump1(load_n0), .pump2(load_n1), .pump3(load_n2), .pump4(load_n3), .out_ctrl0(out_ctrl0), .out_ctrl1(out_ctrl1), .out_ctrl2(out_ctrl2), .out_ctrl3(out_ctrl3));

seg_top st(.clk(clk), .RESET(RESET), .count2(count2), .count_ACK2(count_ACK2), .seg_out(seg_out), .digit_select(digit_select));


endmodule