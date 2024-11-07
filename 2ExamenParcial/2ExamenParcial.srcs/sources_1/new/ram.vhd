----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2024 10:17:17
-- Design Name: 
-- Module Name: ram - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ram is
    Port ( Escribir : in STD_LOGIC;
           valor : in STD_LOGIC_VECTOR (3 downto 0):="0000";
		   salida : out STD_LOGIC_VECTOR (3 downto 0));
end ram;

architecture Behavioral of ram is
	signal registro : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    
    process(Escribir)       
    begin
        if (rising_edge(Escribir)) then 
            registro <= valor;
        end if;   
    end process;
    salida <= registro;

end Behavioral;
