library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Toplevel is
    Port ( sw : in STD_LOGIC_VECTOR(1 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           segments : out STD_LOGIC_VECTOR (6 downto 0);
           anodes : out STD_LOGIC_VECTOR (3 downto 0);
           leds : out std_logic_vector (3 downto 0));
end Toplevel;

architecture Structural of Toplevel is

--type state_type is (f1, f2, f3, f4);
--begin
--process(clk, reset, sw0, sw1)
--begin
--end process;
component clock_divider is
Port ( clk : in STD_LOGIC;
           message_clk : out STD_LOGIC);
end component clock_divider;

component state_machine is
Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component state_machine;

component led_ctrl is
    Port ( states_in : in STD_LOGIC_VECTOR (3 downto 0);
           states_out : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           seg0 : out STD_LOGIC_VECTOR (3 downto 0);
           seg2 : out STD_LOGIC_VECTOR (3 downto 0));
end component led_ctrl;

component LEDdisplay IS
	PORT (
		  clk					: IN  STD_LOGIC;
		  seg0,seg1,seg2,seg3		: IN  STD_LOGIC_VECTOR(6 downto 0);
        seg       		: OUT  STD_LOGIC_VECTOR(6  downto 0);
		  an					: OUT STD_LOGIC_VECTOR(3 downto 0));		  
END component LEDdisplay;

component display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;


signal clk_sig: std_logic;
signal states : std_logic_vector(3 downto 0);
signal s0: std_logic_vector(3 downto 0);
signal s2: std_logic_vector(3 downto 0);
signal seg0: std_logic_vector(6 downto 0);
signal seg2: std_logic_vector(6 downto 0);


begin

CD: clock_divider
    port map (
    clk => clk,
    message_clk => clk_sig);
    
SM: state_machine
    port map(
    clk => clk_sig,
    sw => sw,
    reset => reset,
    output => states);
    
LC: led_ctrl
    port map(
    states_in => states,
    states_out => leds,
    sw => sw,
    seg0 => s0,
    seg2 => s2);
    
    
DD1: display_driver
    port map(
        inputs=>s0,
        seg_out=>seg0
    );
    
DD2: display_driver
    port map(
        inputs=>s2,
        seg_out=>seg2
    );
    
LD: LEDdisplay
        port map(
        clk => clk,
        seg0 => seg0,
        seg1 => "1111111",
        seg2 => seg2,
        seg3 => "1111111",
        seg => segments,
        an => anodes);
    

end Structural;
