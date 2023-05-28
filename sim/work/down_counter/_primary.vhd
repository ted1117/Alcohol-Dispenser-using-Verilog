library verilog;
use verilog.vl_types.all;
entity down_counter is
    generic(
        IDLE            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        TEN             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        NINE            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        EIGHT           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        SEVEN           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        SIX             : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        FIVE            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        FOUR            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        THREE           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        TWO             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        ONE             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        ZERO            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        RESET           : in     vl_logic;
        count2          : in     vl_logic;
        count_ACK2      : in     vl_logic;
        cnt1            : out    vl_logic_vector(3 downto 0);
        cnt0            : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of TEN : constant is 1;
    attribute mti_svvh_generic_type of NINE : constant is 1;
    attribute mti_svvh_generic_type of EIGHT : constant is 1;
    attribute mti_svvh_generic_type of SEVEN : constant is 1;
    attribute mti_svvh_generic_type of SIX : constant is 1;
    attribute mti_svvh_generic_type of FIVE : constant is 1;
    attribute mti_svvh_generic_type of FOUR : constant is 1;
    attribute mti_svvh_generic_type of THREE : constant is 1;
    attribute mti_svvh_generic_type of TWO : constant is 1;
    attribute mti_svvh_generic_type of ONE : constant is 1;
    attribute mti_svvh_generic_type of ZERO : constant is 1;
end down_counter;
