----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 19:45:24
-- Design Name: 
-- Module Name: IFID - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IFID is
    Port ( clk : in STD_LOGIC;
           entrada : in STD_LOGIC_VECTOR (31 downto 0);
           salida : out STD_LOGIC_VECTOR (31 downto 0));
end IFID;

architecture Behavioral of IFID is
signal guardarValor: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
signal contador: STD_LOGIC_VECTOR(1 downto 0) :="00";
begin
    guardarValor <= entrada;
    process(clk) begin
        if(rising_edge(clk) and (clk = '1')) then
            
                salida <= guardarValor;
            
        end if;
        
    end process;

end Behavioral;
