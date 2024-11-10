----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 14:19:41
-- Design Name: 
-- Module Name: multiplexor32bitsMemtoReg - Behavioral
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

entity multiplexor32bitsMemtoReg is
    Port ( DR : in STD_LOGIC_VECTOR (31 downto 0);
           salidaALU : in STD_LOGIC_VECTOR (31 downto 0);
           busW : out STD_LOGIC_VECTOR (31 downto 0);
           MemtoReg : in STD_LOGIC);
end multiplexor32bitsMemtoReg;

architecture Behavioral of multiplexor32bitsMemtoReg is

begin
    busW <= salidaALU when (MemtoReg = '0') else DR; 

end Behavioral;
