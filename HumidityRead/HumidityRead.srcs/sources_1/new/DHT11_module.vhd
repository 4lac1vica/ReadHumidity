----------------------------------------------------------------------------------
-- Company: TUCN
-- Engineer: Todi Tinu-Constantin
-- 
-- Create Date: 02/24/2026 02:56:21 PM
-- Design Name: DHT11_module
-- Module Name: DHT11_module - Behavioral
-- Project Name: HumidityRead
-- Target Devices: Basys 3
-- Tool Versions: 2024.1
-- Description: module for DHT11 sensor 
-- 
-- Dependencies: --
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

entity DHT11_module is
  Port ( 
        clk : in std_logic; -- clock signal 100MHz 
        start : in std_logic; -- start signal
        data_io : inout std_logic; -- inout port for data transmission between FPGA and sensor 
        temp : out unsigned(7 downto 0);  -- temperature
        humidity : out unsigned(7 downto 0); -- humidity 
        done : out std_logic -- done signal 
  );
end DHT11_module;

architecture Behavioral of DHT11_module is

type state_type is (
    IDLE, START_LOW, RELEASE, 
    RESP_LOW, RESP_HIGH, READ_BITS,      ---  => FSM States 
    FINISHED
);

signal state : state_type := IDLE; --state of the FSM 

signal counter : unsigned(31 downto 0) := (others => '0'); -- counter for clock division 
signal bit_cnt : integer range 0 to 39 := 0; -- counter for the read bits 
signal shift : std_logic_vector(39 downto 0) := (others => '0'); -- shift register 

signal data_out : std_logic := '1'; -- the value from the DATA line 

signal data_dir : std_logic := '0'; -- FPGA drives line 
begin

data_io <= data_out when data_dir = '1' else 'Z';

process(clk)
begin 
    if rising_edge(clk) then 
        case state is 
            
            when IDLE => 
                done <= '0'; 
                if start = '1' then 
                    counter <= (others => '0');
                    data_dir <= '1';
                    data_out <= '0';
                    shift <= (others => '0');
                    state <= START_LOW;
                end if; 
            
            when START_LOW => 
                if counter = 1_800_000 then 
                    data_dir <= '0';
                    counter <= (others => '0');
                    state <= RELEASE; 
                else
                    counter <= counter + 1;    
                end if;    
            
            when RELEASE => 
                if counter = 4_000 then 
                    counter <= (others => '0'); 
                    state <= RESP_LOW;
                else 
                    counter <= counter + 1;    
                
                end if;       
            
            when RESP_LOW => 
                if data_io = '0' then 
                    state <= RESP_HIGH;
                end if;        
            
            when RESP_HIGH => 
                if data_io = '1' then 
                    bit_cnt <= 0; 
                    counter <= (others => '0');
                    state <= READ_BITS;
                end if;
            
            when READ_BITS => 
                if data_io = '0' then 
                    counter <= (others => '0');
                else 
                    counter <= counter + 1;
                    if counter = 5_000 then 
                        shift <= shift(38 downto 0) & '1';
                        bit_cnt <= bit_cnt + 1;
                    elsif counter = 2_000 then 
                        shift <= shift(38 downto 0) & '0';
                        bit_cnt <= bit_cnt + 1;
                    end if;
                end if;
                
                if bit_cnt = 39 then 
                    state <= FINISHED;
                end if;
            
            when FINISHED => 
                humidity <= unsigned(shift(39 downto 32));
                temp <= unsigned(shift(23 downto 16));
                done <= '1';
                state <= IDLE;
                
        end case;
    end if;
end process;



end Behavioral;
