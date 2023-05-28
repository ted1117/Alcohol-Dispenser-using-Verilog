module ledcontrol(clk,
                  i_switch1,
                  i_switch2,
                  i_switch3,
                  i_switch4,
                  RESET,
                  out_ctrl0,
                  out_ctrl1,
                  out_ctrl2,
                  out_ctrl3,
                  pump1,
                  pump2,
                  pump3,
                  pump4);
    
    input clk;
    input i_switch1, i_switch2, i_switch3, i_switch4;
    input out_ctrl0, out_ctrl1, out_ctrl2, out_ctrl3;
    input RESET;
    output reg pump1, pump2, pump3, pump4;
    
    wire o_switch1, o_switch2, o_switch3, o_switch4;
    wire out_ctrl = out_ctrl0 || out_ctrl1 || out_ctrl2 || out_ctrl3;
    
    debounce DEBOUNCE1(clk, i_switch1, RESET, o_switch1);
    debounce DEBOUNCE2(clk, i_switch2, RESET, o_switch2);
    debounce DEBOUNCE3(clk, i_switch3, RESET, o_switch3);
    debounce DEBOUNCE4(clk, i_switch4, RESET, o_switch4);
    
    
    
    always @ (posedge o_switch1 or negedge RESET or posedge out_ctrl) begin
        if (!RESET)
            pump1 <= 1'b0;
        else if (out_ctrl)
            pump1 <= 0;
        else
            pump1 <= 1;
    end
    
    always @ (posedge o_switch2 or negedge RESET or posedge out_ctrl) begin
        if (!RESET)
            pump2 <= 1'b0;
        else if (out_ctrl)
            pump2 <= 0;
        else
            pump2 <= 1;
    end
    
    always @ (posedge o_switch3 or negedge RESET or posedge out_ctrl) begin
        if (!RESET)
            pump3 <= 1'b0;
        else if (out_ctrl)
            pump3 <= 0;
        else
            pump3 <= 1;
    end
    
    always @ (posedge o_switch4 or negedge RESET or posedge out_ctrl) begin
        if (!RESET)
            pump4 <= 1'b0;
        else if (out_ctrl)
            pump4 <= 0;
        else
            pump4 <= 1;
    end
    /*else begin
     case({o_switch, led}) begin
     2'b00 : led <= led;
     2'b01 : led <= led;
     2'b10 : led <= 1'b1;
     2'b11 : led <= 1'b
     */
endmodule
    
