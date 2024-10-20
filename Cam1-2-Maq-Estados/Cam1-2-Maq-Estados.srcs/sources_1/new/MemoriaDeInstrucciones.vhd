----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2024 09:13:17
-- Design Name: 
-- Module Name: MemoriaDeInstrucciones - Behavioral
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

entity MemoriaDeInstrucciones is
    Port ( addr : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
end MemoriaDeInstrucciones;

architecture Behavioral of MemoriaDeInstrucciones is
type rom_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0); --para las 9 instrucciones
constant rom_data : rom_type := (
				"00000000011000100000100000000001",
				"00000000011000100000100000000010",
				"00000000011000100000100000000011",
				"00000000011000100000100000000100",
				"00000000011000100000100000000101",
				"00000000011000100000100000000110",
				"00000000011000100000100000011111",
				"00000000011000100000100000111111",
				"00000000011000100000100001111111",
				"00000000011000100000100000000001",
				"00000000011000100000100000000010",
				"00000000011000100000100000000011",
				"00000000011000100000100000000100",
				"00000000011000100000100000000111",
				"00000000011000100000100000001111",
				"00000000011000100000100000011111",
				"00000000011000100000100000111111",
				"00000000011000100000100001111111",
				"00000000011000100000100000000001",
				"00000000011000100000100000000010",
				"00000000011000100000100000000011",
				"00000000011000100000100000000100",
				"00000000011000100000100000000111",
				"00000000011000100000100000001111",
				"00000000011000100000100000011111",
				"00000000011000100000100000111111",
				"00000000011000100000100001111111",
				"00000000011000100000100000000001",
				"00000000011000100000100000000010",
				"00000000011000100000100000000011",
				"00000000011000100000100000000100",
				"00000000011000100000100000000111");
begin

process(clk)
	begin
		if rising_edge(clk) then
			instruccion <= rom_data(conv_integer(addr)); --Se va a ir a la salida el codigo en MIPS de la operacion indicada por addr en rom_data
		end if;
	end process;


end Behavioral;
