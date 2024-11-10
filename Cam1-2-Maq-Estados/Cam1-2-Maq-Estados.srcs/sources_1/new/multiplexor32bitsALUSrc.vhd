----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 14:18:45
-- Design Name: 
-- Module Name: multiplexor32bitsALUSrc - Behavioral
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

entity multiplexor32bitsALUSrc is
    Port ( busB : in STD_LOGIC_VECTOR (31 downto 0);
           inmed : in STD_LOGIC_VECTOR (31 downto 0);
           rw : out STD_LOGIC_VECTOR (31 downto 0);
           ALUSrc : in STD_LOGIC);
end multiplexor32bitsALUSrc;

architecture Behavioral of multiplexor32bitsALUSrc is

begin
    rw <= busB when (ALUSrc = '0') else inmed; 

end Behavioral;
