module emit1_datapath #(
    parameter CLEAR = 4'b0000,
    parameter EMIT_CNT = 4'd5
) (
    input clk,
    input cnt1_ld,
    input cnt1_clr,
    input cnt1_ACK,
    output eq_0,
    output reg out1
);
    reg [3:0] cnt1;
    always @(posedge clk) begin
        case ({cnt1_ld, cnt1_clr, cnt1_ACK})
            3'b000: cnt1 <= cnt1;
            3'b001: cnt1 <= cnt1;
            3'b010: cnt1 <= CLEAR;
            3'b011: cnt1 <= CLEAR;
            3'b100: cnt1 <= EMIT_CNT;
            3'b101: begin
                if (cnt1 != 0) cnt1 <= cnt1 - 1;
                else cnt1 <= cnt1;
            end
            3'b110: cnt1 <= CLEAR;
            3'b111: cnt1 <= CLEAR;
            default: cnt1 <= cnt1;
        endcase
    end

    always @(posedge clk) begin
        case ({cnt1_ld, cnt1_clr, cnt1_ACK})
            3'b000: out1 <= cnt1[0] | cnt1[1] | cnt1[2] | cnt1[3];
            3'b001: out1 <= out1;
            3'b010: out1 <= 0;
            3'b011: out1 <= out1;
            3'b100: out1 <= 1;
            3'b101: out1 <= cnt1[0] | cnt1[1] | cnt1[2] | cnt1[3];
            3'b110: out1 <= out1;
            3'b111: out1 <= out1;
            default: out1 <= out1;
        endcase
    end

    //assign out1 = ({cnt1_ld, cnt1_clr, cnt1_ACK} == 3'b101 || {cnt1_ld, cnt1_clr, cnt1_ACK} == 3'b000) ? (cnt1[0] | cnt1[1] | cnt1[2]) : 0;
    assign eq_0 = cnt1 ? 0 : 1;
endmodule