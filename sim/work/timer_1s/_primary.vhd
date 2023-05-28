library verilog;
use verilog.vl_types.all;
entity timer_1s is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        COUNT           : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        ACK             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        CNT             : integer := 10
    );
    port(
        clk             : in     vl_logic;
        count2          : in     vl_logic;
        count_ACK2      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of COUNT : constant is 1;
    attribute mti_svvh_generic_type of ACK : constant is 1;
    attribute mti_svvh_generic_type of CNT : constant is 1;
end timer_1s;
