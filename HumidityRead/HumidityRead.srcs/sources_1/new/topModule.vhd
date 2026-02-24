----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2026 07:44:55 PM
-- Design Name: 
-- Module Name: topModule - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topModule is
  Port ( 
    cat : out std_logic_vector(6 downto 0);
    an : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    sw : in std_logic;
    dht_io : inout std_logic
  );
end topModule;

architecture Behavioral of topModule is

signal temp_value : unsigned(7 downto 0) := (others => '0');
signal hum_value : unsigned(7 downto 0) := (others => '0');
signal tick1s : std_logic := '0';
signal value : unsigned(13 downto 0) := (others => '0');
signal clk_counter : unsigned(27 downto 0) := (others => '0');

component SSD
     Port ( 
            clk : in std_logic;
            value : in unsigned(13 downto 0); 
            an : out std_logic_vector(3 downto 0);
            cat : out std_logic_vector(6 downto 0) 
 );
 end component;

component DHT11_module 
       Port( 
        clk : in std_logic; -- clock signal 100MHz 
        start : in std_logic; -- start signal
        data_io : inout std_logic; -- inout port for data transmission between FPGA and sensor 
        temp : out unsigned(7 downto 0);  -- temperature
        humidity : out unsigned(7 downto 0); -- humidity 
        done : out std_logic -- done signal
    );
end component;

begin

process(clk)            -- clock divider 
begin 
    if rising_edge(clk) then 
      if clk_counter = 99_999_999 then 
        clk_counter <= (others => '0');
        tick1s <= '1';
      else 
        clk_counter <= clk_counter + 1;
        tick1s <= '0';
      end if; 
    end if;
end process;


process(sw, temp_value, hum_value) -- sw = '0' to display temp
                                   -- sw = '1' to display humi
begin 
    if sw = '0' then 
        value <= resize(temp_value, value'length);
    else 
        value <= resize(hum_value, value'length);
    end if;

end process;

DHT11: DHT11_module port map (clk => clk, start => tick1s, data_io => dht_io, temp => temp_value, humidity => hum_value, done => open);
SSDtag : SSD port map (clk => clk, value => value, an => an, cat => cat); 

end Behavioral;
