library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        load3           : in     vl_logic;
        load2           : in     vl_logic;
        load1           : in     vl_logic;
        load0           : in     vl_logic;
        p0              : out    vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic;
        seg_out         : out    vl_logic;
        digit_select    : out    vl_logic
    );
end top;
