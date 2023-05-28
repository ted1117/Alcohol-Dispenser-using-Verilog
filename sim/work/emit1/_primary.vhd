library verilog;
use verilog.vl_types.all;
entity emit1 is
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        out_ctrl        : in     vl_logic;
        load1           : in     vl_logic;
        count_ACK2      : in     vl_logic;
        out1            : out    vl_logic;
        count2          : out    vl_logic
    );
end emit1;
