module emit2 (
    input clk,
    input RESET,
    input out_ctrl,
    input load2,
    input count_ACK2,
    //output out_ACK,
    output out2,
    output count2
);
    wire cnt2_ld, cnt2_clr, cnt2_ACK, eq_0;

    emit2_ctrl e1(.clk(clk), .RESET(RESET), .load2(load2), .out_ctrl(out_ctrl), .count_ACK2(count_ACK2), .eq_0(eq_0), .count2(count2), .cnt2_ld(cnt2_ld), .cnt2_clr(cnt2_clr), .cnt2_ACK(cnt2_ACK));
    emit2_datapath e2(.clk(clk), .cnt2_ld(cnt2_ld), .cnt2_clr(cnt2_clr), .cnt2_ACK(cnt2_ACK), .eq_0(eq_0), .out2(out2));
    
endmodule