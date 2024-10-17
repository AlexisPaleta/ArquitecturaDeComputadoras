----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 10:31:30
-- Design Name: 
-- Module Name: ram - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram is
    Port ( clk : in STD_LOGIC;
           addr1 : in STD_LOGIC_VECTOR (4 downto 0);
           addr2 : in STD_LOGIC_VECTOR (4 downto 0);
           addr3 : in STD_LOGIC_VECTOR (4 downto 0);
           resultadoOP : in STD_LOGIC_VECTOR (4 downto 0);
           Escribir : in STD_LOGIC;
           valor1 : out STD_LOGIC_VECTOR (4 downto 0);
           valor2 : out STD_LOGIC_VECTOR (4 downto 0));
end ram;

architecture Behavioral of ram is
    signal control: std_logic := '0';
    type ram_type is array (0 to 31) of STD_LOGIC_VECTOR(4 downto 0); --para las 9 instrucciones
    signal RAM : ram_type := (
				"00001",
				"00010",
				"00011",
				"00100",
				"00101",
				"00110",
				"00111",
				"01000",
				"01001",
				"01010",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000",
				"00000"  --32 registros de 5 bits cada uno
				);
begin

    process(clk) 
        
    begin
        if rising_edge(clk) then --Modo lectura
               valor1 <= RAM(conv_integer(addr1)); 
               valor2 <= RAM(conv_integer(addr2));         
        end if;
       
    end process;
    
    process(Escribir)
    begin
        if falling_edge(Escribir) then -- Modo escritura
            RAM(conv_integer(addr3)) <= resultadoOP;
        end if;   
    end process;

end Behavioral;
