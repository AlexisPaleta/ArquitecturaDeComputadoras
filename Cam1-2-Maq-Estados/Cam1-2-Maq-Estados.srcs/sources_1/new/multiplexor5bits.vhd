----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 14:17:31
-- Design Name: 
-- Module Name: multiplexor5bits - Behavioral
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

entity multiplexor5bits is
    Port ( rt : in STD_LOGIC_VECTOR (4 downto 0);
           rd : in STD_LOGIC_VECTOR (4 downto 0);
           rw : out STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in STD_LOGIC);
end multiplexor5bits;

architecture Behavioral of multiplexor5bits is

begin
    rw <= rd when (RegDst = '1') else rt;  -- Cuando RegDst vale 1 rd es la salida, sino es rt

end Behavioral;
