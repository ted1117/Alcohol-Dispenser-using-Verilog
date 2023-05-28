library verilog;
use verilog.vl_types.all;
entity emit0_ctrl is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        INIT            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        \WAIT\          : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        COUNT           : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        load0           : in     vl_logic;
        out_ctrl        : in     vl_logic;
        count_ACK2      : in     vl_logic;
        eq_0            : in     vl_logic;
        count2          : out    vl_logic;
        cnt0_ld         : out    vl_logic;
        cnt0_clr        : out    vl_logic;
        cnt0_ACK        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of INIT : constant is 1;
    attribute mti_svvh_generic_type of \WAIT\ : constant is 1;
    attribute mti_svvh_generic_type of COUNT : constant is 1;
end emit0_ctrl;
