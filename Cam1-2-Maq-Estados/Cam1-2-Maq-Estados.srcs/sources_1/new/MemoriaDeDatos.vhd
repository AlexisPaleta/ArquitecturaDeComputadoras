----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2024 16:19:59
-- Design Name: 
-- Module Name: MemoriaDeDatos - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemoriaDeDatos is
    Port ( clk : in STD_LOGIC;
           ADDR : in std_logic_vector(31 downto 0);
           DW : in std_logic_vector(31 downto 0);
           DR : out std_logic_vector(31 downto 0);
           MemRead: in std_logic;
           MemWrite: in std_logic);
end MemoriaDeDatos;

architecture Behavioral of MemoriaDeDatos is

    type mem_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0); 
    signal MemDatos : mem_type := ( 
    "00000000000000000000000000000000",
    "00000000000000000000000000000011",
    "00000000000000000000000000001001",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000"  -- 32 registros de 32 bits cada uno
    );

begin

	process(clk)
	begin
		if (rising_edge(clk)) then
			if (MemRead = '1') then
				
			elsif (MemWrite = '1')then  
				MemDatos(conv_integer(ADDR)/4)<=  DW; -- se convierte la direccion en entero y se divide por cuatro y da como resultado el indice para  guardar en memoria de datos
			end if;
		end if;
	end process;
	
	DR <= MemDatos(conv_integer(ADDR)/4) when (MemRead = '1') else "00000000000000000000000000000000"; -- se convierte la direccion en entero y se divide por cuatro y da como resultado el indice para leer la memoria de datos

end Behavioral;
