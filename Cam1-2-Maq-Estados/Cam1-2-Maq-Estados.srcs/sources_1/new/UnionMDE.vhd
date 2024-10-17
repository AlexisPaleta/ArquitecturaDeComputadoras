----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2024 09:52:38
-- Design Name: 
-- Module Name: UnionCaminos1Y2MaqEstados - Behavioral
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

entity UnionMDE is
    Port ( clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            op : in STD_LOGIC_VECTOR (5 downto 0));
end UnionMDE;

architecture Behavioral of UnionMDE is

component Union1y2
    Port ( clk_pc : in STD_LOGIC;
           clk_MemInstrucciones : in STD_LOGIC;
           clk_RAM : in STD_LOGIC;
           clk_RegALU : in STD_LOGIC;
           reset : in STD_LOGIC);
end component;

component MDE
    Port ( clk : in STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           edo_4 : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

signal E1: STD_LOGIC;
signal E2: STD_LOGIC;
signal E3: STD_LOGIC;
signal E4: STD_LOGIC;

begin

    caminos: Union1y2
    Port map(clk_pc => E1,
             clk_MemInstrucciones => E2,
             clk_RAM => E3,
             clk_RegALU => E4,
              reset => reset );


    maquinaEstados: MDE
    Port map(clk => clk,
             edo_1 => E1,
             edo_2 => E2,
             edo_3 => E3,
             edo_4 => E4,
             reset => reset
                );
end Behavioral;
