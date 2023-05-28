module debounce(
    input   clk,
    input   i_switch,
    input   RESET,
    output  o_switch
);
    parameter C_DEBOUNCE_LIMIT = 7'd125;
    //parameter C_DEBOUNCE_LIMIT = 21'd1_250_000; // 10msec as 125Mhz
    //reg        state = 1'b1;
    reg state;
    reg [19:0] count;

    always @(posedge clk or negedge RESET) begin
        if(!RESET) begin
            state <= 1'b0;
            count <= 0;
        end
        else if ( (i_switch != state) && (count < C_DEBOUNCE_LIMIT) )
            count <= count + 1;

        else if (count == C_DEBOUNCE_LIMIT) begin
            count <= 0;
            state <= i_switch;
        end

        else
            count <= 0;
    end

    assign o_switch = state;

endmodule