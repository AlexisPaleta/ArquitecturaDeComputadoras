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
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
end MemoriaDeInstrucciones;

architecture Behavioral of MemoriaDeInstrucciones is
type rom_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0); --para las 9 instrucciones
constant rom_data : rom_type := (
				"00000000011000100000100000000001", -- suma -- 0 -- El resultado es 7
				"00000000011000100000100000000010", -- resta -- 1 -- El resultado es 1
				"00000000011000100000100000000011", -- AND -- 2 -- El resultado es 0
				"00000000011000100000100000000100", -- OR -- 3 - El resultado es 7
				"00000000011000100000100000000101", -- NOT -- 4 
				"00000000011000100000100000000110", -- Hasta aqui son las 6 instrucciones tipo R, complemento a 2 -- 5
				"10101100000001000000000000000000", -- sw -- 6 -- En la memoria de datos se guarda un 05 en la posicion 0
				"10001100000010100000000000001000", -- lw -- 7 -- En la ram, se guarda en la posicion 9 (recordar que empieza en indice cero, esta seria la decima posicion realmente) de la ram el valor del registro 2 de la mem de datos
				"00010001100011010000000000001110", -- beq, se comparan los valores 12 y 13 de la ram, se salta a la inst 14 -- 8
				"00000000011000100000100000000001", -- 9
				"00000000011000100000100000000010", -- 10
				"00000000011000100000100000000011", -- 11
				"00000000011000100000100000000100", -- 12
				"00000000011000100000100000000111", -- 13
				"00000000011000100000100000000010", -- RESTA -- posicion 14 -- El resultado es 1
				"00010101100011100000000000000000", -- bne -- 15, se comparan los registros 12 y 14, se salta a la instruccion 0
				"00000000011000100000100000111111", -- 16
				"00000000011000100000100001111111", -- 17
				"00000000011000100000100000000001", -- 18 
				"00000000011000100000100000000010", -- 19
				"00000000011000100000100000000011", -- 20
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


			instruccion <= rom_data(conv_integer(addr)); --Se va a ir a la salida el codigo en MIPS de la operacion indicada por addr en rom_data




end Behavioral;
