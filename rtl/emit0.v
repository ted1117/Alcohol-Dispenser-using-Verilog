module emit0 (
    input clk,
    input RESET,
    input out_ctrl,
    input load0,
    input count_ACK2,
    //output out_ACK,
    output out0,
    output count2
);
    wire cnt0_ld, cnt0_clr, cnt0_ACK, eq_0;

    emit0_ctrl e1(.clk(clk), .RESET(RESET), .load0(load0), .out_ctrl(out_ctrl), .count_ACK2(count_ACK2), .eq_0(eq_0), .count2(count2), .cnt0_ld(cnt0_ld), .cnt0_clr(cnt0_clr), .cnt0_ACK(cnt0_ACK));
    emit0_datapath e2(.clk(clk), .cnt0_ld(cnt0_ld), .cnt0_clr(cnt0_clr), .cnt0_ACK(cnt0_ACK), .eq_0(eq_0), .out0(out0));

endmodule