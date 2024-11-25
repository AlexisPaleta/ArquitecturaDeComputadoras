----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 21:05:00
-- Design Name: 
-- Module Name: IDEX - Behavioral
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

entity IDEX is
    Port ( clk : in STD_LOGIC;
           extSigno : in STD_LOGIC_VECTOR (31 downto 0);
           direccionEscritura : in STD_LOGIC_VECTOR (4 downto 0);
           RD1 : in STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in STD_LOGIC;
           MemRead : in STD_LOGIC;
           Aluop : in STD_LOGIC_VECTOR (1 downto 0); -- hasta aqui son los registros almacenados
           extSignoOUT : out STD_LOGIC_VECTOR (31 downto 0);
           direccionEscrituraOUT : out STD_LOGIC_VECTOR (4 downto 0);
           RD1OUT : out STD_LOGIC_VECTOR (31 downto 0);
           RegWriteOUT : out STD_LOGIC;
           MemReadOUT : out STD_LOGIC;
           AluopOUT : out STD_LOGIC_VECTOR (1 downto 0));
end IDEX;

architecture Behavioral of IDEX is
signal guardaRegWrite: STD_LOGIC;
signal guardaMemRead: STD_LOGIC;
signal guardaAluop: STD_LOGIC_VECTOR(1 downto 0);
signal guardavalor1: STD_LOGIC_VECTOR(31 downto 0);
signal guardadireccionEscritura: STD_LOGIC_VECTOR(4 downto 0);
signal guardaextension: STD_LOGIC_VECTOR(31 downto 0);
signal contador: STD_LOGIC_VECTOR(1 downto 0) :="00";
begin

    guardaRegWrite <= RegWrite;
    guardaMemRead <= MemRead;
    guardaAluop <= Aluop;
    guardavalor1 <= RD1;
    guardadireccionEscritura <= direccionEscritura;
    guardaextension <= extSigno;
    
    process(clk) begin
        if(rising_edge(clk) and (clk = '1')) then
            
            if(contador = "01") then
                RegWriteOUT <= guardaRegWrite;
                MemReadOUT <= guardaMemRead;
                AluopOUT <= guardaAluop;
                RD1OUT <= guardavalor1;
                direccionEscrituraOUT <= guardadireccionEscritura;
                extSignoOUT <= guardaextension;
            else
                contador <= contador + 1;
            end if;
            
        end if;
        
    end process;
    


end Behavioral;
