`timescale 1ns/1ns

module timer_1s #(
    parameter   IDLE    = 2'b00,
    parameter   COUNT   = 2'b01,
    parameter   ACK     = 2'b10,
    //parameter   CNT     = 10
    parameter CNT       = 27'd125_000_000 // Count for 1sec for real. 
) (
    input       clk,
    input       count2,
    output      count_ACK2
);
    reg [26:0]  cnt;
    reg [1:0]   state;
    reg [1:0]   n_state;

    // Reset
    always @(posedge clk or negedge count2) begin
        if (!count2) 
            state <= IDLE;
        else 
            state <= n_state;
    end
    
    // State Transition
    always @(*) begin
        case (state)
            IDLE:    n_state <= count2 ? COUNT : IDLE;
            COUNT:   n_state <= (cnt == CNT - 1) ? ACK : COUNT;
            ACK:     n_state <= IDLE; 
            default: n_state <= IDLE;
        endcase
    end

    // Counter
    always @(posedge clk) begin
        //cnt <= 0;
        case (state)
            IDLE:   cnt <= 0;
            COUNT:  cnt <= cnt + 1; 
            ACK:    cnt <= 0;
            default: cnt <= 0;
        endcase
    end

    // Output
    assign count_ACK2 = (state == ACK) ? 1 : 0;
    
endmodule