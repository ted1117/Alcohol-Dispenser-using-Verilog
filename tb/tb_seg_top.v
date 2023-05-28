`timescale 1ns/1ps
module tb_seg_top();
reg clk, RESET, count2, count_ACK2;
wire [6:0] seg_out;
wire digit_select;

seg_top SEG(.clk(clk), .RESET(RESET), .seg_out(seg_out), .digit_select(digit_select), .count2(count2), .count_ACK2(count_ACK2));


initial clk = 0;
always #4 clk = ~ clk;

initial begin
    RESET = 0;

    repeat(2) @(posedge clk);
    RESET = 1;
    count2 = 1;
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;

    repeat(4) @(posedge clk);
    count_ACK2 = 1;
    repeat(4) @(posedge clk);
    count_ACK2 = 0;
    

end
endmodule