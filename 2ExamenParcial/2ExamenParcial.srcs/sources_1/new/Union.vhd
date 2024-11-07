----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2024 09:50:39
-- Design Name: 
-- Module Name: Union - Behavioral
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

entity Union is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           temp_real: in std_logic_vector(3 downto 0);
           segment_A : out  STD_LOGIC;
           segment_B : out  STD_LOGIC;
           segment_C : out  STD_LOGIC;
           segment_D : out  STD_LOGIC;
           segment_E : out  STD_LOGIC;
           segment_F : out  STD_LOGIC;
           segment_G : out  STD_LOGIC);
end Union;

architecture Behavioral of Union is

component MaquinaEstados 
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           escribir_ram: OUT std_logic;
           rom_ram : out STD_LOGIC);
    end component;
    
    component Sietesegmentos 
    Port ( Digit : in  STD_LOGIC_VECTOR (3 downto 0);
           segment_A : out  STD_LOGIC;
           segment_B : out  STD_LOGIC;
           segment_C : out  STD_LOGIC;
           segment_D : out  STD_LOGIC;
           segment_E : out  STD_LOGIC;
           segment_F : out  STD_LOGIC;
           segment_G : out  STD_LOGIC);
    end component;
    
    component MultiplexorPantalla 
    Port ( seleccion : in STD_LOGIC;
           ram : in STD_LOGIC_VECTOR(3 downto 0);
           rom : in STD_LOGIC_VECTOR(3 downto 0);
           salida : out STD_LOGIC_VECTOR(3 downto 0)
           );
    end component;
    
    component ROM 
    Port (val : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component ram 
    Port ( Escribir : in STD_LOGIC;
           valor : in STD_LOGIC_VECTOR (3 downto 0);
		   salida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component contador
        Port ( clkT : in STD_LOGIC;
               clkOut : out STD_LOGIC);
    end component;
    
    signal escribir : std_logic;
    signal selection : std_logic;
    signal temperatura : std_logic_vector(3 downto 0);
    signal temperaturaRam : std_logic_vector(3 downto 0);
    signal temperaturaRom : std_logic_vector(3 downto 0);
    signal reloj: std_logic;

begin

    cont: contador 
        Port Map(clkT => clk,
                 clkOut => reloj
                    );

    MDE: MaquinaEstados 
        Port map(clk => reloj,
                 reset => reset,
                 escribir_ram => escribir,
                 rom_ram => selection
                    );
    segsiete: Sietesegmentos
        Port map(segment_A => segment_A,
                 segment_B => segment_B,
                 segment_C => segment_C,
                 segment_D => segment_D,
                 segment_E => segment_E,
                 segment_F => segment_F,
                 segment_G => segment_G,
                 Digit => temperatura
                    );
    mux: MultiplexorPantalla
        Port map(seleccion => selection,
                 ram => temperaturaRam,
                 rom => temperaturaRom,
                 salida => temperatura
                    );
                    
    memRom: ROM
        Port map(val => temperaturaRom
                    );
                    
    memRam: ram
        Port map(Escribir => escribir,
                 valor => temp_real,
                 salida => temperaturaRam
                    );

    


end Behavioral;
