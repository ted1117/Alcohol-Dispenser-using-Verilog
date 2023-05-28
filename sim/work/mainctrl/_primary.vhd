library verilog;
use verilog.vl_types.all;
entity mainctrl is
    generic(
        IDLE            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        \SELECT\        : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        EMIT_RD0        : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        EMIT_RD1        : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        EMIT_RD2        : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        EMIT_RD3        : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        EMIT0           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        EMIT1           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        EMIT2           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        EMIT3           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        load0           : in     vl_logic;
        load1           : in     vl_logic;
        load2           : in     vl_logic;
        load3           : in     vl_logic;
        out0            : in     vl_logic;
        out1            : in     vl_logic;
        out2            : in     vl_logic;
        out3            : in     vl_logic;
        out_ctrl0       : out    vl_logic;
        out_ctrl1       : out    vl_logic;
        out_ctrl2       : out    vl_logic;
        out_ctrl3       : out    vl_logic;
        p0              : out    vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of \SELECT\ : constant is 1;
    attribute mti_svvh_generic_type of EMIT_RD0 : constant is 1;
    attribute mti_svvh_generic_type of EMIT_RD1 : constant is 1;
    attribute mti_svvh_generic_type of EMIT_RD2 : constant is 1;
    attribute mti_svvh_generic_type of EMIT_RD3 : constant is 1;
    attribute mti_svvh_generic_type of EMIT0 : constant is 1;
    attribute mti_svvh_generic_type of EMIT1 : constant is 1;
    attribute mti_svvh_generic_type of EMIT2 : constant is 1;
    attribute mti_svvh_generic_type of EMIT3 : constant is 1;
end mainctrl;
