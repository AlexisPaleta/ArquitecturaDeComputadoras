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
           resultadoOP : in STD_LOGIC_VECTOR (31 downto 0);
           Escribir : in STD_LOGIC;
           valor1 : out STD_LOGIC_VECTOR (31 downto 0);
           valor2 : out STD_LOGIC_VECTOR (31 downto 0));
end ram;

architecture Behavioral of ram is
    signal control: std_logic := '0';
    type ram_type is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0); --para las 9 instrucciones
    signal RAM : ram_type := ( 
    "00000000000000000000000000000000", --0
    "00000000000000000000000000000010", --1
    "00000000000000000000000000000011", --2
    "00000000000000000000000000000100", --3
    "00000000000000000000000000000101", --4
    "00000000000000000000000000000110", --5
    "00000000000000000000000000000111", --6
    "00000000000000000000000000001000",--7
    "00000000000000000000000000001001", --8
    "00000000000000000000000000001010", --9
    "00000000000000000000000000000000", --10
    "00000000000000000000000000000000", --11
    "00000000000000000000000000000110", --12
    "00000000000000000000000000000110", --13
    "00000000000000000000000000000101", --14
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
        if (clk'event and clk='1') then 
               if(Escribir = '1') then -- Modo escritura
                    RAM(conv_integer(addr3)) <= resultadoOP; 
               end if;      
        end if;
       
    end process;
    
    valor1 <= RAM(conv_integer(addr1)); --En todo momento se están leyendo las entradas de los datos.
    valor2 <= RAM(conv_integer(addr2));   
    

end Behavioral;
