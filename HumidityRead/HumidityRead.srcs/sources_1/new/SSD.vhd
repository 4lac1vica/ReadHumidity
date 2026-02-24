----------------------------------------------------------------------------------
-- Company: TUCN 
-- Engineer: Todi Tinu-Constantin
-- 
-- Create Date: 02/23/2026 07:48:12 PM
-- Design Name: SSD.vhd
-- Module Name: SSD - Behavioral
-- Project Name: HumidityRead
-- Target Devices: Basys 3  
-- Tool Versions: 2024.1 
-- Description: The module for seven segment display
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use IEEE.unsigned_std.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD is
  Port ( 
    clk : in std_logic;
    value : in unsigned(13 downto 0); -- valoarea de afisat 
    an : out std_logic_vector(3 downto 0); --anodes 
    cat : out std_logic_vector(6 downto 0) --cathodes
  );
end SSD;

architecture Behavioral of SSD is

    signal refreshCounter : unsigned(19 downto 0) := (others => '0');
    signal digitSelect : unsigned (1 downto 0) := (others => '0');
    signal digit : std_logic_vector(3 downto 0);
    signal d0, d1, d2, d3 : std_logic_vector(3 downto 0);
    
    
begin



-- clock divider 
process(clk)
begin
    if rising_edge(clk) then 
        refreshCounter <= refreshCounter + 1;
    end if;
end process;
    
    digitSelect <= refreshCounter(19 downto 18);
    
    
    

--an <= "1110";
--digit <= "0000";


process(value)
variable val_int : integer;
begin 
    val_int := to_integer(value);
    d0 <= std_logic_vector(to_unsigned(val_int mod 10, 4));
    d1 <= std_logic_vector(to_unsigned((val_int / 10) mod 10, 4));
    d2 <= std_logic_vector(to_unsigned((val_int / 100) mod 10, 4));
    d3 <= std_logic_vector(to_unsigned((val_int / 1000) mod 10, 4));
end process;


--selectarea afisajului 

process(digitSelect)
begin 
    case digitSelect is 
        when "00" => 
            an <= "1110";
            digit <= d0;
        when "01" => 
            an <= "1101";
            digit <= d1;
        when "10" => 
            an <= "1011";
            digit <= d2;
        when "11" => 
            an <= "0111";
            digit <= d3;
        when others => 
            an <= "1111";
            digit <= "0000";
    end case;
end process;




-- BCD 
process(digit)
begin 
    case digit is 
        when "0000" => cat <= "0000001"; -- 0
        when "0001" => cat <= "1001111"; -- 1 
        when "0010" => cat <= "0010010"; -- 2
        when "0011" => cat <= "0000110"; -- 3 
        when "0100" => cat <= "1001100"; -- 4 
        when "0101" => cat <= "0100100"; -- 5 
        when "0110" => cat <= "0100000"; -- 6
        when "0111" => cat <= "0001111"; -- 7
        when "1000" => cat <= "0000000"; -- 8
        when "1001" => cat <= "0000100"; -- 9
        when others => cat <= "1111111"; -- stins    
    end case;
end process;    

end Behavioral;
