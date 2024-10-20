----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2024 09:50:28
-- Design Name: 
-- Module Name: RegistroALU - Behavioral
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

entity RegistroALU is
    Port ( clk : in STD_LOGIC;
           valor_entrada : in STD_LOGIC_VECTOR (31 downto 0);
           valor_salida : out STD_LOGIC_VECTOR (31 downto 0));
end RegistroALU;

architecture Behavioral of RegistroALU is
    signal valor: STD_LOGIC_VECTOR (31 downto 0);
begin

    process (clk) begin
        if(rising_edge(clk)) then
            valor <= valor_entrada;
        end if;
    end process;
    
    valor_salida <= valor;

end Behavioral;
