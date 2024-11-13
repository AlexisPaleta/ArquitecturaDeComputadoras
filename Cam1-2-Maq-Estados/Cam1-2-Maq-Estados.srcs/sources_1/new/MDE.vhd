----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2024 10:37:10
-- Design Name: 
-- Module Name: MaquinaDeEstados - Behavioral
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

entity MDE is
    Port ( RegDst : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           branch: out std_logic;
           op : in STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out STD_LOGIC_VECTOR (1 downto 0));
end MDE;

architecture Behavioral of MDE is

    TYPE Estados is(E0,E1,E2,E3);
    signal codigoOperacion: STD_LOGIC_VECTOR (5 downto 0);


begin
	
	--seccion combinacional
	process(op) begin
	
	   Case op is
	       when "000000" => -- Instrucciones tipo R
			    
			    RegDst <= '1';
			    ALUSrc <= '0';
			    MemtoReg <= '0';
			    RegWrite <= '1';
			    MemRead <= '0';
			    MemWrite <= '0';
			    branch <= '0';
			    Aluop <= "11";

	       when "100011" => -- Instruccion tipo I - lw
			    
			    RegDst <= '0';
			    ALUSrc <= '1';
			    MemtoReg <= '1';
			    branch <= '0';
			    MemRead <= '1';
			    MemWrite <= '0';
			    Aluop <= "00";
			    
			    RegWrite <= '1';
			    
			    
	       
	       when "101011" => -- Instruccion tipo I - sw
			    
			    RegDst <= '1'; --Es indistinto
			    ALUSrc <= '1';
			    MemtoReg <= '0';
			    RegWrite <= '0';
			    MemRead <= '0';
			    MemWrite <= '1';
			    branch <= '0';
			    Aluop <= "00";
	       
	       when "000100" => --Instruccion tipo I para beq
			    
			    RegDst <= '1';
			    ALUSrc <= '0';
			    MemtoReg <= '0';
			    RegWrite <= '0';
			    MemRead <= '0';
			    MemWrite <= '0';
			    branch <= '1';
			    Aluop <= "01";
		   when "111111" =>
			    
			    RegDst <= '1';
			    ALUSrc <= '0';
			    MemtoReg <= '0';
			    RegWrite <= '0';
			    MemRead <= '0';
			    MemWrite <= '0';
			    branch <= '0';
			    Aluop <= "01";
		   when others =>
			    
			    RegDst <= '0';
			    ALUSrc <= '0';
			    MemtoReg <= '0';
			    RegWrite <= '0';
			    MemRead <= '0';
			    MemWrite <= '0';
			    branch <= '0';
			    Aluop <= "01";
	   end case;
	end process;


end Behavioral;
