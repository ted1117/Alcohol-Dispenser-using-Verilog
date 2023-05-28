library verilog;
use verilog.vl_types.all;
entity debounce is
    generic(
        C_DEBOUNCE_LIMIT: vl_logic_vector(0 to 6) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        i_switch        : in     vl_logic;
        RESET           : in     vl_logic;
        o_switch        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of C_DEBOUNCE_LIMIT : constant is 1;
end debounce;
