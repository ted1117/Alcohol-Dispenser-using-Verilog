library verilog;
use verilog.vl_types.all;
entity Pmod_SSD is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        value           : in     vl_logic_vector(7 downto 0);
        segments        : out    vl_logic_vector(6 downto 0);
        digit_select    : out    vl_logic
    );
end Pmod_SSD;
