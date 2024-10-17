----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.09.2024 09:31:04
-- Design Name: 
-- Module Name: DecodificadorInstrucciones - Behavioral
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

entity DecodificadorInstrucciones is
    Port ( instruccion : in STD_LOGIC_VECTOR (31 downto 0);
           codigoOperacion : out STD_LOGIC_VECTOR (5 downto 0);
           registro1 : out STD_LOGIC_VECTOR (4 downto 0);
           registro2 : out STD_LOGIC_VECTOR (4 downto 0);
           resultado : out STD_LOGIC_VECTOR (4 downto 0);
           shamt : out STD_LOGIC_VECTOR (4 downto 0);
           funcion : out STD_LOGIC_VECTOR (5 downto 0));
end DecodificadorInstrucciones;

architecture Behavioral of DecodificadorInstrucciones is

begin
    codigoOperacion <= instruccion(31 downto 26);
    registro1 <= instruccion(25 downto 21);
    registro2 <= instruccion(20 downto 16);
    resultado <= instruccion(15 downto 11);
    shamt <= instruccion(10 downto 6);
    funcion <= instruccion(5 downto 0);


end Behavioral;
