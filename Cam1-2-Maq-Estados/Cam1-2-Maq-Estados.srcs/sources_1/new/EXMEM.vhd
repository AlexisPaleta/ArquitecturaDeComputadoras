----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 22:56:56
-- Design Name: 
-- Module Name: EXMEM - Behavioral
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

entity EXMEM is
    Port ( clk : in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           MemRead : in STD_LOGIC;
           resultadoALU : in STD_LOGIC_VECTOR (31 downto 0);
           direccionEscritura : in STD_LOGIC_VECTOR (4 downto 0);
           direccionEscOUT : out STD_LOGIC_VECTOR (4 downto 0);
           RegWriteOUT : out STD_LOGIC;
           MemReadOUT : out STD_LOGIC;
           resultadoOUT : out STD_LOGIC_VECTOR (31 downto 0));
end EXMEM;

architecture Behavioral of EXMEM is

signal guardaRegWrite: STD_LOGIC;
signal guardaMemRead: STD_LOGIC;
signal guardaresultadoALU: STD_LOGIC_VECTOR(31 downto 0);
signal guardadireccionEscritura: STD_LOGIC_VECTOR(4 downto 0);
signal contador: STD_LOGIC_VECTOR(1 downto 0) :="00";

begin

    guardaRegWrite <= RegWrite;
    guardaMemRead <= MemRead;
    guardaresultadoALU <= resultadoALU;
    guardadireccionEscritura <= direccionEscritura;
    
    process(clk) begin
        if(rising_edge(clk) and (clk = '1')) then
            
            if(contador = "10") then
                RegWriteOUT <= guardaRegWrite;
                MemReadOUT <= guardaMemRead;
                direccionEscOUT <= guardadireccionEscritura;
                resultadoOUT <= guardaresultadoALU;
            else
                contador <= contador + 1;
            end if;
            
        end if;
        
    end process;

end Behavioral;