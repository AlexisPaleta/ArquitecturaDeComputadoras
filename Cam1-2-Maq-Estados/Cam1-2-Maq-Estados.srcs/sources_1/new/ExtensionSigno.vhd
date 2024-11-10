----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 14:20:50
-- Design Name: 
-- Module Name: ExtensionSigno - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExtensionSigno is
    Port ( inm : in STD_LOGIC_VECTOR (15 downto 0);
           inmed : out STD_LOGIC_VECTOR (31 downto 0));
end ExtensionSigno;

architecture Behavioral of ExtensionSigno is
begin
    process(inm) begin
        -- Expansión manual del vector
        inmed(31 downto 16) <= (others => '0'); -- Rellenar los bits superiores con ceros
        inmed(15 downto 0) <= inm; -- Copiar los 16 bits originales
    end process;
    
end Behavioral; 
