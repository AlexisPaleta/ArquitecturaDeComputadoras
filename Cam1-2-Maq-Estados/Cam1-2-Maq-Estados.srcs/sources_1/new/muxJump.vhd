----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 09:32:17
-- Design Name: 
-- Module Name: muxJump - Behavioral
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

entity muxJump is
    Port ( sumaPC : in STD_LOGIC_VECTOR (4 downto 0);
           inmediato : in STD_LOGIC_VECTOR (4 downto 0);
           jump : in STD_LOGIC;
           nuevaInstruccion : out STD_LOGIC_VECTOR (4 downto 0));
end muxJump;

architecture Behavioral of muxJump is

begin

nuevaInstruccion  <= inmediato when (jump = '1') else sumaPC; 

end Behavioral;
