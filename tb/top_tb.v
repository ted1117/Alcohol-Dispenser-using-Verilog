`timescale 1ns / 1ps
module top_tb();

reg clk, RESET, load3, load2, load1, load0;
wire p0, p1, p2, p3, seg_out, digit_select;

top top_fuck(.clk(clk), .RESET(RESET), .load3(load3), .load2(load2), .load1(load1), .load0(load0), .p0(p0), .p1(p1), .p2(p2), .p3(p3), .seg_out(seg_out), .digit_select(digit_select));

initial clk = 0;
always #4 clk = ~clk;

initial begin
load0=0;
load1=0;
load2=0;
load3=0;
RESET = 0;

repeat(1) @(posedge clk);
RESET = 1;


//Fifth
repeat(126) @(posedge clk);
load3 = 1;

repeat(126) @(posedge clk);
load3 = 0;
//Third
/*
repeat(126) @(posedge clk);
load0 = 1;

repeat(126) @(posedge clk);
load0 = 0;*/
//Fourth
repeat(126) @(posedge clk);
load1 = 1;

repeat(126) @(posedge clk);
load1 = 0;
//Second
repeat(126) @(posedge clk);
load0 = 1;

repeat(126) @(posedge clk);
load0 = 0;
//First
repeat(2) @(posedge clk);
load2 = 1;

repeat(126) @(posedge clk);
load2 = 0;

/*
repeat(2) @(posedge clk);
load3 = 1;

repeat(2) @(posedge clk);
load3 = 0;

repeat(2) @(posedge clk);
load0 = 1;

repeat(2) @(posedge clk);
load0 = 0;

repeat(105) @(posedge clk);
load3 = 1;
repeat(5) @(posedge clk);
load3 = 0;
*/
end

endmodule