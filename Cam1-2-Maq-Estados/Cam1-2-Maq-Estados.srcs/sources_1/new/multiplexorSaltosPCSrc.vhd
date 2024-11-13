----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2024 10:32:53
-- Design Name: 
-- Module Name: multiplexorSaltosPCSrc - Behavioral
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

entity multiplexorSaltosPCSrc is
    Port ( zero : in STD_LOGIC;
           branch : in STD_LOGIC;
           PC : in STD_LOGIC_VECTOR (4 downto 0);
           Inmediato : in STD_LOGIC_VECTOR (4 downto 0);
           salidaPCSrcs : out STD_LOGIC_VECTOR (4 downto 0));
end multiplexorSaltosPCSrc;

architecture Behavioral of multiplexorSaltosPCSrc is

begin

   salidaPCSrcs  <= Inmediato when (branch = '1' and zero = '1') else PC; 

end Behavioral;
