library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador is
    Port ( clkT : in STD_LOGIC;
           clkOut : out STD_LOGIC);
end contador;

architecture Behavioral of contador is
--SIGNAL temp: STD_LOGIC := '0';
--SIGNAL cont: INTEGER RANGE 0 TO 1 :=0; --En caso de implementarse en la trajeta, se debe cambiar el valor de 1 a 74999999 ;

begin
    clkOut <= clkT;
    -- En caso de usarse como divisor de frecuencias, usar el siguiente código 
    --PROCESS(clkT) 
    --    BEGIN
    --    if (rising_edge(clkT)) then
    --        if (cont = 1)then -- Igual aquí
    --            temp <= NOT (temp);
    --            cont <= 0;
    --        else
    --            cont <= cont+1;
    --        end if;
    --    end if;
    --END PROCESS;
    
    --clkOut <= temp;

end Behavioral;