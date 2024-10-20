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
    "00000000000000000000000000000001",
    "00000000000000000000000000000010",
    "00000000000000000000000000000011",
    "00000000000000000000000000000100",
    "00000000000000000000000000000101",
    "00000000000000000000000000000110",
    "00000000000000000000000000000111",
    "00000000000000000000000000001000",
    "00000000000000000000000000001001",
    "00000000000000000000000000001010",
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
        if rising_edge(clk) then --Modo lectura
               valor1 <= RAM(conv_integer(addr1)); 
               valor2 <= RAM(conv_integer(addr2));         
        end if;
       
    end process;
    
    process(Escribir) --La senal de Escribir, va a ser la misma que el Estado 4 de la maquina de estados, que es el que
    -- le dice al registro de la ALU que almacene un valor, solo que va a cambiar a guardar el valor que se le indique
    --En la direccion 3, en el flanco de bajada de esa senal, para asi estar seguro de que el registro de la alu ya tiene
    --guardado un valor
    begin
        if falling_edge(Escribir) then -- Modo escritura
            RAM(conv_integer(addr3)) <= resultadoOP;
        end if;   
    end process;

end Behavioral;
