module emit1 (
    input clk,
    input RESET,
    input out_ctrl,
    input load1,
    input count_ACK2,
    //output out_ACK,
    output out1,
    output count2
);
    wire cnt1_ld, cnt1_clr, cnt1_ACK, eq_0;

    emit1_ctrl e1(.clk(clk), .RESET(RESET), .load1(load1), .out_ctrl(out_ctrl), .count_ACK2(count_ACK2), .eq_0(eq_0), .count2(count2), .cnt1_ld(cnt1_ld), .cnt1_clr(cnt1_clr), .cnt1_ACK(cnt1_ACK));
    emit1_datapath e2(.clk(clk), .cnt1_ld(cnt1_ld), .cnt1_clr(cnt1_clr), .cnt1_ACK(cnt1_ACK), .eq_0(eq_0), .out1(out1));
    
endmodule