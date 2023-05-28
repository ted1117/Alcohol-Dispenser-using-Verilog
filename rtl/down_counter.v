/*
module down_counter #(
    parameter IDLE  = 4'b0000,
    parameter TEN   = 4'b1010,
    parameter NINE  = 4'b1001,
    parameter EIGHT = 4'b1000,
    parameter SEVEN = 4'b0111,
    parameter SIX   = 4'b0110,
    parameter FIVE  = 4'b0101,
    parameter FOUR  = 4'b0100,
    parameter THREE = 4'b0011,
    parameter TWO   = 4'b0010,
    parameter ONE   = 4'b0001,
    parameter ZERO  = 4'b1111
) (
    input clk,
    input RESET,
    input count2,
    input count_ACK2,
    output reg [3:0] cnt1,
    output reg [3:0] cnt0
);
    reg [3:0] state;
    reg [3:0] n_state;

    // State Transition
    always @(posedge clk or negedge RESET) begin
        if (!RESET)
            state <= IDLE;
        else
            state <= n_state;
    end

    // Output
    always @(state) begin
        case (state)
            IDLE:   cnt0 <= 10;
            //TEN:    cnt0 <= 10;
            //NINE:   cnt0 <= 9;
            EIGHT:  cnt0 <= 8;
            SEVEN:  cnt0 <= 7;
            SIX:    cnt0 <= 6;
            FIVE:   cnt0 <= 5;
            FOUR:   cnt0 <= 4;
            THREE:  cnt0 <= 3;
            TWO:    cnt0 <= 2;
            ONE:    cnt0 <= 1;
            ZERO:   cnt0 <= 0; 
            default: cnt0 <= 0;
        endcase
    end

    //assign cnt1 = (state == TEN) ? 1 : 0;

    // FSM
    always @(posedge clk or posedge count_ACK2) begin
        case (state)
            IDLE:   n_state <= count2 ? EIGHT : IDLE;
            //TEN:    n_state <= count_ACK2 ? NINE : TEN;
            //NINE:   n_state <= count_ACK2 ? EIGHT : NINE;
            EIGHT:  n_state <= count_ACK2 ? SEVEN : EIGHT;
            SEVEN:  n_state <= count_ACK2 ? SIX : SEVEN;
            SIX:    n_state <= count_ACK2 ? FIVE : SIX;
            FIVE:   n_state <= count_ACK2 ? FOUR : FIVE;
            FOUR:   n_state <= count_ACK2 ? THREE : FOUR;
            THREE:  n_state <= count_ACK2 ? TWO : THREE;
            TWO:    n_state <= count_ACK2 ? ONE : TWO;
            ONE:    n_state <= count_ACK2 ? ZERO : ONE;
            ZERO:   n_state <= IDLE;
            default: n_state <= IDLE;
        endcase
    end
    
    /*
    // FSM
    always @(posedge clk or posedge count_ACK2) begin
        case (state)
            IDLE:   begin
                n_state <= count2 ? EIGHT : IDLE;
                cnt0 <= 10;
            end
            //TEN:    n_state <= count_ACK2 ? NINE : TEN;
            //NINE:   n_state <= count_ACK2 ? EIGHT : NINE;
            EIGHT:  begin
                n_state <= count_ACK2 ? SEVEN : EIGHT;
                cnt0 <= 8;
            end
            SEVEN:  begin
                n_state <= count_ACK2 ? SIX : SEVEN;
                cnt0 <= 7;
            end
            SIX:    begin
                n_state <= count_ACK2 ? FIVE : SIX;
                cnt0 <= 6;
            end
            FIVE:   begin
                n_state <= count_ACK2 ? FOUR : FIVE;
                cnt0 <= 5;
            end
            FOUR:   begin
                n_state <= count_ACK2 ? THREE : FOUR;
                cnt0 <= 4;
            end
            THREE:  begin
                n_state <= count_ACK2 ? TWO : THREE;
                cnt0 <= 3;
            end
            TWO:    begin
                n_state <= count_ACK2 ? ONE : TWO;
                cnt0 <= 2;
            end
            ONE:    begin
                n_state <= count_ACK2 ? ZERO : ONE;
                cnt0 <= 1;
            end
            ZERO:   begin
                n_state <= IDLE;
                cnt0 <= 0;
            end
            default: n_state <= IDLE;
        endcase
    end
    
endmodule
*/

module down_counter (
    input clk,
    input count2,
    input count_ACK2,
    input RESET,
    output [3:0] cnt0
);
    reg [3:0] counter_down;

    always @(posedge clk or negedge RESET) begin
        if(!RESET)
            counter_down <= 4'b0101;
        else if(counter_down == 4'b0000)
            counter_down <= 4'b0101;
        else begin
            if (count_ACK2)
                counter_down <= counter_down - 1;
            else
                counter_down <= counter_down;
        end
    end
    assign cnt0 = counter_down - 1;
endmodule