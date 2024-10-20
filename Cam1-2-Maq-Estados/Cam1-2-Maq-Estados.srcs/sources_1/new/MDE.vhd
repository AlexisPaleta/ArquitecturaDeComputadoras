----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2024 10:37:10
-- Design Name: 
-- Module Name: MaquinaDeEstados - Behavioral
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

entity MDE is
    Port ( clk : in STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           edo_4 : out STD_LOGIC;
           op : in STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC);
end MDE;

architecture Behavioral of MDE is

    TYPE Estados is(E0,E1,E2,E3);
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
	
	process(Edo_presente) begin
	
	   Case Edo_presente is
	       when E0 =>
	            edo_1 <= '1';
			    edo_2 <= '0';
			    edo_3 <= '0';
			    edo_4 <= '0';
			    Aluop <= "11";
			    Edo_siguiente <= E1;
	       when E1 =>
	            edo_1 <= '0';
			    edo_2 <= '1';
			    edo_3 <= '0';
			    edo_4 <= '0';
			    Aluop <= "11";
			    Edo_siguiente <= E2;
	       
	       when E2 =>
	            edo_1 <= '0';
			    edo_2 <= '0';
			    edo_3 <= '1';
			    edo_4 <= '0';
			    Aluop <= "11";
			    Edo_siguiente <= E3;
	       
	       when E3 =>
	            edo_1 <= '0';
			    edo_2 <= '0';
			    edo_3 <= '0';
			    edo_4 <= '1';
			    Aluop <= "11";
			    Edo_siguiente <= E0;   
	   end case;
	end process;
	
	process(op)
	begin
	   case op is
	      when "000000" =>
	           Aluop <= "11";
	      when others =>
	           Aluop <= "11";
	   end case;
	end process;


end Behavioral;
