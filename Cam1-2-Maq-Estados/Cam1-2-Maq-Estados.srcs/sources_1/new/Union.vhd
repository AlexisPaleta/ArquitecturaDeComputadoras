----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2024 09:47:37
-- Design Name: 
-- Module Name: Union_camino_1 - Behavioral
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

entity Union is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
end Union;

architecture Behavioral of Union is

component PC
    Port ( PC_in : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component sumador --Este realmente es el sumador, porque PC si seria como el contador, o mas bien un mini registro
Port ( entradaPC : in STD_LOGIC_VECTOR (4 downto 0);
       reset : in std_logic;
       cnt_out : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component MemoriaDeInstrucciones 
    Port ( addr : in STD_LOGIC_VECTOR (4 downto 0);
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal PC_out_reg: std_logic_vector (4 downto  0);
signal cnt_out_reg: std_logic_vector (4 downto 0);

begin

    registro_instrucciones: PC 
    port map(clk => clk,
             PC_in => cnt_out_reg,
             PC_out => PC_out_reg);
             
    mem_instrucciones: MemoriaDeInstrucciones
    port map(addr => PC_out_reg,
             instruccion => instruccion);
             
    sumadorInst: sumador 
    port map(entradaPC => PC_out_reg,
             reset => reset,
             cnt_out => cnt_out_reg);
             
                


end Behavioral;
