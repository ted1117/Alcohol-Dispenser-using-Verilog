`timescale 1ns/1ps
module mainctrl_tb;

reg clk, RESET, load0, load1, load2, load3, out0, out1, out2, out3;
wire out_ctrl;


mainctrl mc(.clk(clk), .RESET(RESET), .load0(load0), .load1(load1), .load2(load2), .load3(load3), .out0(out0), .out1(out1), .out2(out2), .out3(out3), .out_ctrl(out_ctrl));



	initial clk = 0;
    always #4 clk = ~clk;

    initial begin
    	RESET = 0;
    	load0 = 0;
    	load1 = 0;
    	load2 = 0;
		load3 = 0;
		out0 = 0;
		out1 = 0;
		out2 = 0;
		out3 = 0;

		repeat(2) @(posedge clk);
		load2 = 1;
		repeat(2) @(posedge clk);
		out2 = 1;
		repeat(2) @(posedge clk);
		out2 = 1;
		load3 = 1;
		repeat(2) @(posedge clk);
		out2 = 1;

		repeat(2) @(posedge clk);
		out2 = 0;
		load3 = 0;
		repeat(5) @(posedge clk);
		load2 = 0;

		



    end


endmodule