----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2024 09:34:45
-- Design Name: 
-- Module Name: UnionCam1Y2 - Behavioral
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

entity Union1y2 is
    Port ( clk: in STD_LOGIC;
           reset : in STD_LOGIC);
end Union1y2;

architecture Behavioral of Union1y2 is

    component Union
        Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           NuevaInstruccion : in STD_LOGIC_VECTOR (4 downto 0);
           SumaInstruccion : out STD_LOGIC_VECTOR (4 downto 0);
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Union2
        Port ( clk : in STD_LOGIC;
           SumaInstruccion : in STD_LOGIC_VECTOR (4 downto 0);
           nuevaInstruccion : out STD_LOGIC_VECTOR (4 downto 0);
           instruccion : in STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal instruccion_interna: STD_LOGIC_VECTOR (31 downto 0);
    signal instruccion_mux: STD_LOGIC_VECTOR (4 downto 0);
    signal instruccionDeSumador: STD_LOGIC_VECTOR (4 downto 0);

begin

    camino_1: Union
        Port map( clk => clk,
                  reset => reset,
                  NuevaInstruccion => instruccion_mux,
                  SumaInstruccion => instruccionDeSumador,
                  instruccion => instruccion_interna);
                  
    camino_2: Union2
        Port map( clk => clk,
                  NuevaInstruccion => instruccion_mux,
                  SumaInstruccion => instruccionDeSumador,
                  instruccion => instruccion_interna);

end Behavioral;
