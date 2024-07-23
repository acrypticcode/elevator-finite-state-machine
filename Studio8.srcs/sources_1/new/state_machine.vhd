library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity state_machine is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end state_machine;

architecture Behavioral of state_machine is

type floors is (f1, f2, f3, f4);
    signal floor: floors;
--signal fnum: std_logic_vector (1 downto 0):="00";

begin
process(clk, sw, reset)
begin
--if (reset='1') then
--    fnum <= "00";
    
--elsif rising_edge(clk) then
--    --case fnum is
--        --when sw > fnum;
--    if sw > fnum then
--        fnum <= fnum + 1;
--    elsif sw < fnum then
--        fnum <= fnum - 1;
--    end if;

--end if;

--if fnum = 0
if (reset='1') then
    floor <= f1;
elsif rising_edge(clk) then
    case floor is
        when f1 =>
            if sw > "00" then
                floor <= f2;
            end if;
        when f2 =>
            if sw > "01" then
                floor <= f3;
            elsif sw < "01" then
                floor <= f1;
            end if;
        when f3 =>               
            if sw > "10" then
                   floor <= f4;
                elsif sw < "10" then
                    floor <= f2;
                end if;
        when f4 =>
            if sw < "11" then
                floor <= f3;
            end if;
    end case;
end if;
            

end process;
            
           
output(0) <= '1' when floor=f1 else '0';
output(1) <= '1' when floor=f2 else '0';
output(2) <= '1' when floor=f3 else '0';
output(3) <= '1' when floor=f4 else '0';

end Behavioral;
