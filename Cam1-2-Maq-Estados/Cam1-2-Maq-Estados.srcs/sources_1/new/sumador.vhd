----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2024 09:13:17
-- Design Name: 
-- Module Name: ContadorPrograma - Behavioral
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

entity sumador is  --Este realmente vendria a ser el sumador
    Port ( entradaPC : in STD_LOGIC_VECTOR (4 downto 0);
           reset : in std_logic;
           cnt_out : out STD_LOGIC_VECTOR (4 downto 0));
end sumador;

architecture Behavioral of sumador is
    signal contador: STD_LOGIC_VECTOR(4 downto 0);
    signal temp: STD_LOGIC_VECTOR(4 downto 0);
begin
    
    proceso_contador: process (entradaPC,reset) 
    begin
		    if(reset = '1') then
			     temp <= "00000";
		    else
			     temp <= entradaPC + 1;
			     if(temp = "11111") then
				    temp <= "00000";
			     end if;
			 end if;
	end process;
	 cnt_out <= temp;    

end Behavioral;
