library verilog;
use verilog.vl_types.all;
entity seg_top is
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        count2          : in     vl_logic;
        count_ACK2      : in     vl_logic;
        seg_out         : out    vl_logic_vector(6 downto 0);
        digit_select    : out    vl_logic
    );
end seg_top;
