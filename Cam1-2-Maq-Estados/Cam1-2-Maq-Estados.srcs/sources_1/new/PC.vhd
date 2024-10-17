----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2024 09:22:36
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( PC_in : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (3 downto 0));
end PC;

architecture Behavioral of PC is
signal temp_reg: STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin

    proceso_PC: process (clk) begin
		if rising_edge(clk) then
			temp_reg <= PC_in; --Se almacena la direccion que venga de PC_in, y no cambiará hasta el siguiente ciclo de reloj
		end if;
	end process;
	PC_out <= temp_reg; --Asigna el registro almacenado a la salida
    

end Behavioral;
