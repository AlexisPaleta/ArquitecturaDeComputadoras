----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 20:18:19
-- Design Name: 
-- Module Name: prue - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prue is
    Port ( clk : in STD_LOGIC;
           sal : out STD_LOGIC_VECTOR (31 downto 0));
end prue;

architecture Behavioral of prue is
signal cont: STD_LOGIC:= '0';
begin

process (clk) begin
    if(rising_edge(clk) and (clk = '1')) then
        if(cont = '0') then
            sal <= "00000000000000000000000000000001";
        else
            sal <= "00000000000000000000000000000011";
        end if;
    end if;
end process;


end Behavioral;
