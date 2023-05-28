library verilog;
use verilog.vl_types.all;
entity ledcontrol is
    port(
        clk             : in     vl_logic;
        i_switch1       : in     vl_logic;
        i_switch2       : in     vl_logic;
        i_switch3       : in     vl_logic;
        i_switch4       : in     vl_logic;
        RESET           : in     vl_logic;
        out_ctrl0       : in     vl_logic;
        out_ctrl1       : in     vl_logic;
        out_ctrl2       : in     vl_logic;
        out_ctrl3       : in     vl_logic;
        pump1           : out    vl_logic;
        pump2           : out    vl_logic;
        pump3           : out    vl_logic;
        pump4           : out    vl_logic
    );
end ledcontrol;
