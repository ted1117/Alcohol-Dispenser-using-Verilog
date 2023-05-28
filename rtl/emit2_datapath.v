module emit2_datapath #(
    parameter CLEAR = 4'b0000,
    parameter EMIT_CNT = 4'd5
) (
    input clk,
    input cnt2_ld,
    input cnt2_clr,
    input cnt2_ACK,
    output eq_0,
    output reg out2
);
    reg [3:0] cnt2;

    always @(posedge clk) begin
        case ({cnt2_ld, cnt2_clr, cnt2_ACK})
            3'b000: cnt2 <= cnt2;
            3'b001: cnt2 <= cnt2;
            3'b010: cnt2 <= CLEAR;
            3'b011: cnt2 <= CLEAR;
            3'b100: cnt2 <= EMIT_CNT;
            3'b101: begin
                if (cnt2 != 0) cnt2 <= cnt2 - 1;
                else cnt2 <= cnt2;
            end
            3'b110: cnt2 <= CLEAR;
            3'b111: cnt2 <= CLEAR;
            default: cnt2 <= cnt2;
        endcase
    end

    always @(posedge clk) begin
        case ({cnt2_ld, cnt2_clr, cnt2_ACK})
            3'b000: out2 <= cnt2[0] | cnt2[1] | cnt2[2] | cnt2[3];
            3'b001: out2 <= out2;
            3'b010: out2 <= 0;
            3'b011: out2 <= out2;
            3'b100: out2 <= 1;
            3'b101: out2 <= cnt2[0] | cnt2[1] | cnt2[2] | cnt2[3];
            3'b110: out2 <= out2;
            3'b111: out2 <= out2;
            default: out2 <= out2;
        endcase
    end



    //assign out2 = ({cnt2_ld, cnt2_clr, cnt2_ACK} == 3'b101 || {cnt2_ld, cnt2_clr, cnt2_ACK} == 3'b000) ? (cnt2[0] | cnt2[1] | cnt2[2]) : 0;
    assign eq_0 = cnt2 ? 0 : 1;
endmodule