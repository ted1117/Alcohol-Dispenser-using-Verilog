module emit1_ctrl #(
    parameter IDLE = 2'b00,
    parameter INIT = 2'b01,
    parameter WAIT = 2'b10,
    parameter COUNT = 2'b11
) (
    input clk,
    input RESET,
    input load1,
    input out_ctrl,
    input count_ACK2,
    input eq_0,
    //output out0,
    output reg count2,
    //output reg out_ACK,
    output reg cnt1_ld,
    output reg cnt1_clr,
    output reg cnt1_ACK
);
    reg [1:0] state;
    reg [1:0] n_state;

    // State Transition
    always @(posedge clk) begin
        if (!RESET)
            state <= IDLE;
        else
            state <= n_state;
    end

    // Output
    always @(*) begin
        cnt1_ld<= 0;
        cnt1_clr <= 1;
        cnt1_ACK <= 0;
        //out_ACK <= 0;
        count2 <= 0;
        case (state)
            IDLE: begin
                cnt1_ld <= 0;
                cnt1_clr <= 1;
                cnt1_ACK <= 0;
                //out_ACK <= 0;
                count2 <= 0;
            end
            INIT: begin
                cnt1_ld <= 1;
                cnt1_clr <= 0;
                cnt1_ACK <= 0;
                //out_ACK <= 0;
                count2 <= 0;
            end
            WAIT: begin
                cnt1_ld <= 1;
                cnt1_clr <= 0;
                cnt1_ACK <= 1;
                //out_ACK <= 1;
                count2 <= 0;
            end
            COUNT: begin
                cnt1_ld <= 0;
                cnt1_clr <= 0;
                cnt1_ACK <= 0;
                //out_ACK <= 0;
                count2 <= 1;
            end
            //default: IDLE;
        endcase
    end

    // FSM
    always @(*) begin
        case (state)
            IDLE:  n_state <= load1 ? INIT : IDLE; 
            INIT:  n_state <= out_ctrl ? WAIT : INIT;
            WAIT:  n_state <= eq_0 ? IDLE : COUNT;
            COUNT: n_state <= count_ACK2 ? WAIT : COUNT;
            default: n_state <= IDLE;
        endcase
    end
endmodule