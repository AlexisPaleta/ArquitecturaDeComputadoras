library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ctrlAlu is
    Port ( ALUop : in STD_LOGIC_VECTOR (2 downto 0);
           funcion : in STD_LOGIC_VECTOR (5 downto 0);
           operacion : out STD_LOGIC_VECTOR (2 downto 0));
end ctrlAlu;

architecture Behavioral of ctrlAlu is
    signal op: std_logic_vector (2 downto 0):= "000";
begin
    process(ALUop, funcion) begin
        case ALUop is 
            when "000" => --lw y sw
               op <= "000";
            when "001" => -- beq
                op <= "010";
            when "010" => -- bne
                op <= "011";
            when "011" => -- Para las tipo R
                case funcion is     -- Tadas estas son suposiciones, depende de como este en la memoria de instrucciones
                    when "000001" => -- Para la suma
                        op <= "000";
                    when "000010" => -- Para la resta
                        op <= "001";
                    when "000011" => -- Para el AND
                        op <= "010";
                    when "000100" => -- Para el OR
                        op <= "011";
                    when "000101" => -- Neg de B
                        op <= "100";
                    when "000110" => -- Neg de B
                        op <= "101";
                    when others =>
                        op <= "111";
                end case;
            when "110" => -- Instruccion J
               op <= "110";
            when others =>
                op <= "111";
       end case;
    end process;
    
    operacion <= op;
end Behavioral;