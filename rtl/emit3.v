module emit3 (
    input clk,
    input RESET,
    input out_ctrl,
    input load3,
    input count_ACK2,
    //output out_ACK,
    output out3,
    output count2
);
    wire cnt3_ld, cnt3_clr, cnt3_ACK, eq_0;

    emit3_ctrl e1(.clk(clk), .RESET(RESET), .load3(load3), .out_ctrl(out_ctrl), .count_ACK2(count_ACK2), .eq_0(eq_0), .count2(count2), .cnt3_ld(cnt3_ld), .cnt3_clr(cnt3_clr), .cnt3_ACK(cnt3_ACK));
    emit3_datapath e2(.clk(clk), .cnt3_ld(cnt3_ld), .cnt3_clr(cnt3_clr), .cnt3_ACK(cnt3_ACK), .eq_0(eq_0), .out3(out3));
    
endmodule