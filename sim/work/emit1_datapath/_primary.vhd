library verilog;
use verilog.vl_types.all;
entity emit1_datapath is
    generic(
        CLEAR           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        EMIT_CNT        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        cnt1_ld         : in     vl_logic;
        cnt1_clr        : in     vl_logic;
        cnt1_ACK        : in     vl_logic;
        eq_0            : out    vl_logic;
        out1            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLEAR : constant is 1;
    attribute mti_svvh_generic_type of EMIT_CNT : constant is 1;
end emit1_datapath;
