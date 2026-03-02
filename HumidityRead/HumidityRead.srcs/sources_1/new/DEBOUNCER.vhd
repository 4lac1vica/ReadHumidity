----------------------------------------------------------------------------------
-- Company: TUCN  
-- Engineer: Todi Tinu-Constantin
-- 
-- Create Date: 03/02/2026 11:36:06 AM
-- Design Name: DBC 
-- Module Name: DEBOUNCER - Behavioral
-- Project Name: Read Humidity
-- Target Devices: Basys 3
-- Tool Versions: 2024.1
-- Description: debounce logic for the switches
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

use IEEE.NUMERIC_STD.ALL;



entity DEBOUNCER is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC;
           sw_out : out STD_LOGIC);
end DEBOUNCER;

architecture Behavioral of DEBOUNCER is
    constant DELAY : integer := 650000; --debounce time 
    signal count : integer := 0;
    signal sw_tmp : std_logic := '0';
    
begin
process(clk)
begin 
    if rising_edge(clk) then 
        if sw /= sw_tmp then 
            sw_tmp <= sw;
            count <= 0;
        elsif count = DELAY then 
            sw_out <= sw_tmp;
        else 
            count <= count + 1;    
        end if;   
    end if;
end process;
end Behavioral;
