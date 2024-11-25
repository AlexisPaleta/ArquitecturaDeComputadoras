----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 23:40:25
-- Design Name: 
-- Module Name: MEMWB - Behavioral
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

entity MEMWB is
    Port ( clk : in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           dato : in STD_LOGIC_VECTOR (31 downto 0);
           direccionEscritura : in STD_LOGIC_VECTOR (4 downto 0);
           datoOUT : out STD_LOGIC_VECTOR (31 downto 0);
           RegWriteOUT : out STD_LOGIC;
           direccionEscOUT : out STD_LOGIC_VECTOR (4 downto 0));
end MEMWB;

architecture Behavioral of MEMWB is

signal guardaRegWrite: STD_LOGIC;
signal guardaDato: STD_LOGIC_VECTOR(31 downto 0);
signal guardadireccionEscritura: STD_LOGIC_VECTOR(4 downto 0);
signal contador: STD_LOGIC_VECTOR(1 downto 0) :="00";

begin

    guardaRegWrite <= RegWrite;
    guardaDato <= dato;
    guardadireccionEscritura <= direccionEscritura;
    
    process(clk) begin
        if(rising_edge(clk) and (clk = '1')) then
            
            if(contador = "11") then
                RegWriteOUT <= guardaRegWrite;
                datoOUT <= guardaDato;
                direccionEscOUT <= guardadireccionEscritura;
            else
                contador <= contador + 1;
            end if;
            
        end if;
        
    end process;


end Behavioral;
