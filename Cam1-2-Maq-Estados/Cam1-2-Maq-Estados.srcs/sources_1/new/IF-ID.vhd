----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 19:44:00
-- Design Name: 
-- Module Name: IF-ID - Behavioral
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

entity IF-ID is
    Port ( clk : in STD_LOGIC;
           entrada : in STD_LOGIC_VECTOR (31 downto 0);
           salida : out STD_LOGIC_VECTOR (31 downto 0));
end IF-ID;

architecture Behavioral of IF-ID is

begin


end Behavioral;
