----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2023 10:00:43 PM
-- Design Name: 
-- Module Name: led_ctrl - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_ctrl is
    Port ( states_in : in STD_LOGIC_VECTOR (3 downto 0);
           states_out : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           seg0 : out STD_LOGIC_VECTOR (3 downto 0);
           seg2 : out STD_LOGIC_VECTOR (3 downto 0));
end led_ctrl;

architecture Behavioral of led_ctrl is

begin
seg0(0) <= states_in(1) or states_in(3);
seg0(1) <= states_in(2) or states_in(3);
seg0(3 downto 2) <= "00";

seg2(1 downto 0) <= sw;
seg2(3 downto 2) <= "00";

states_out <= states_in;

end Behavioral;
