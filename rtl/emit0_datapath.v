module emit0_datapath #(
    parameter CLEAR = 4'b0000,
    parameter EMIT_CNT = 4'd5
) (
    input clk,
    input cnt0_ld,
    input cnt0_clr,
    input cnt0_ACK,
    output eq_0,
    output reg out0
);
    reg [3:0] cnt0;

    always @(posedge clk) begin
        case ({cnt0_ld, cnt0_clr, cnt0_ACK})
            3'b000: cnt0 <= cnt0;
            3'b001: cnt0 <= cnt0;
            3'b010: cnt0 <= CLEAR;
            3'b011: cnt0 <= CLEAR;
            3'b100: cnt0 <= EMIT_CNT;
            3'b101: begin
                if (cnt0 != 0) cnt0 <= cnt0 - 1;
                else cnt0 <= cnt0;
            end
            3'b110: cnt0 <= CLEAR;
            3'b111: cnt0 <= CLEAR;
            default: cnt0 <= cnt0;
        endcase
    end

    always @(posedge clk) begin
        case ({cnt0_ld, cnt0_clr, cnt0_ACK})
            3'b000: out0 <= cnt0[0] | cnt0[1] | cnt0[2] | cnt0[3];
            3'b001: out0 <= out0;
            3'b010: out0 <= 0;
            3'b011: out0 <= out0;
            3'b100: out0 <= 1;
            3'b101: out0 <= cnt0[0] | cnt0[1] | cnt0[2] | cnt0[3];
            3'b110: out0 <= out0;
            3'b111: out0 <= out0;
            default: out0 <= out0;
        endcase
    end

    //assign out0 = ({cnt0_ld, cnt0_clr, cnt0_ACK} == 3'b101 || {cnt0_ld, cnt0_clr, cnt0_ACK} == 3'b000) ? (cnt0[0] | cnt0[1] | cnt0[2]) : 0;
    assign eq_0 = cnt0 ? 0 : 1;
endmodule