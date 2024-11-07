----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2024 09:37:04
-- Design Name: 
-- Module Name: MaquinaEstados - Behavioral
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

entity MaquinaEstados is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           escribir_ram: OUT std_logic;
           rom_ram : out STD_LOGIC);
end MaquinaEstados;

architecture Behavioral of MaquinaEstados is

TYPE Estados is(E0,E1);
SIGNAL Edo_presente:Estados;
SIGNAL Edo_siguiente:Estados;

begin

--seccion secuencial
	Process(clk,reset)
	begin
		if(reset='1')then
			Edo_presente <= E0;
		elsif (clk'event and clk='1') then
			Edo_presente <= Edo_siguiente;
		end if;
	end process;
	
	--seccion combinacional
	process (Edo_presente)
	begin
		
		case Edo_presente is
			when E0 =>
			     rom_ram <= '0';
			     escribir_ram <= '0';
			     Edo_siguiente <= E1;
			when E1 =>
				 rom_ram <= '1';
			     escribir_ram <= '1';
				 Edo_siguiente <= E0;
		    when others =>
		         rom_ram <= '0';
			     escribir_ram <= '0';
				 Edo_siguiente <= E0;
			
		end case;
		
	end process;

end Behavioral;
