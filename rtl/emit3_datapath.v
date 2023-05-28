module emit3_datapath #(
    parameter CLEAR = 4'b0000,
    parameter EMIT_CNT = 4'd5
) (
    input clk,
    input cnt3_ld,
    input cnt3_clr,
    input cnt3_ACK,
    output eq_0,
    output reg out3
);
    reg [3:0] cnt3;

    always @(posedge clk) begin
        case ({cnt3_ld, cnt3_clr, cnt3_ACK})
            3'b000: cnt3 <= cnt3;
            3'b001: cnt3 <= cnt3;
            3'b010: cnt3 <= CLEAR;
            3'b011: cnt3 <= CLEAR;
            3'b100: cnt3 <= EMIT_CNT;
            3'b101: begin
                if (cnt3 != 0) cnt3 <= cnt3 - 1;
                else cnt3 <= cnt3;
            end
            3'b110: cnt3 <= CLEAR;
            3'b111: cnt3 <= CLEAR;
            default: cnt3 <= cnt3;
        endcase
    end

    always @(posedge clk) begin
        case ({cnt3_ld, cnt3_clr, cnt3_ACK})
            3'b000: out3 <= cnt3[0] | cnt3[1] | cnt3[2] | cnt3[3];
            3'b001: out3 <= out3;
            3'b010: out3 <= 0;
            3'b011: out3 <= out3;
            3'b100: out3 <= 1;
            3'b101: out3 <= cnt3[0] | cnt3[1] | cnt3[2] | cnt3[3];
            3'b110: out3 <= out3;
            3'b111: out3 <= out3;
            default: out3 <= out3;
        endcase
    end

    //assign out3 = ({cnt3_ld, cnt3_clr, cnt3_ACK} == 3'b101 || {cnt3_ld, cnt3_clr, cnt3_ACK} == 3'b000)  ? (cnt3[0] | cnt3[1] | cnt3[2]) : 0;
    assign eq_0 = cnt3 ? 0 : 1;
endmodule