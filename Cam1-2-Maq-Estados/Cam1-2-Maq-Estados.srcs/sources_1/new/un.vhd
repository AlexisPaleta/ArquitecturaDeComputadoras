----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2024 20:36:25
-- Design Name: 
-- Module Name: un - Behavioral
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

entity un is
    Port ( clk: in STD_LOGIC;
           reset : in STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end un;

architecture Behavioral of un is

component Union
        Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component IFID
    Port ( clk : in STD_LOGIC;
           entrada : in STD_LOGIC_VECTOR (31 downto 0);
           salida : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component DecodificadorInstrucciones
    Port ( instruccion : in STD_LOGIC_VECTOR (31 downto 0);
           codigoOperacion : out STD_LOGIC_VECTOR (5 downto 0);
           registro1 : out STD_LOGIC_VECTOR (4 downto 0);
           registro2 : out STD_LOGIC_VECTOR (4 downto 0);
           resultado : out STD_LOGIC_VECTOR (4 downto 0);
           shamt : out STD_LOGIC_VECTOR (4 downto 0);
           extension : out STD_LOGIC_VECTOR (15 downto 0);
           funcion : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    component MDE
       Port ( RegDst : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           op : in STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component ram
        Port ( clk : in STD_LOGIC;
           addr1 : in STD_LOGIC_VECTOR (4 downto 0);
           addr2 : in STD_LOGIC_VECTOR (4 downto 0);
           addr3 : in STD_LOGIC_VECTOR (4 downto 0);
           resultadoOP : in STD_LOGIC_VECTOR (31 downto 0);
           Escribir : in STD_LOGIC; --El modo de escritura se va a efectuar solo cuando sepa que el registro de la Alu tiene un valor
           valor1 : out STD_LOGIC_VECTOR (31 downto 0);
           valor2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component ExtensionSigno
        Port ( inm : in STD_LOGIC_VECTOR (15 downto 0);
           inmed : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component IDEX
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
    end component;
    
    component EXMEM
        Port ( clk : in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           MemRead : in STD_LOGIC;
           resultadoALU : in STD_LOGIC_VECTOR (31 downto 0);
           direccionEscritura : in STD_LOGIC_VECTOR (4 downto 0);
           direccionEscOUT : out STD_LOGIC_VECTOR (4 downto 0);
           RegWriteOUT : out STD_LOGIC;
           MemReadOUT : out STD_LOGIC;
           resultadoOUT : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MEMWB
        Port ( clk : in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           dato : in STD_LOGIC_VECTOR (31 downto 0);
           direccionEscritura : in STD_LOGIC_VECTOR (4 downto 0);
           datoOUT : out STD_LOGIC_VECTOR (31 downto 0);
           RegWriteOUT : out STD_LOGIC;
           direccionEscOUT : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component Alu
       Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
              B : in  STD_LOGIC_VECTOR (31 downto 0);
              C : in  STD_LOGIC_VECTOR (2 downto 0);
              SALIDA : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MemoriaDeDatos
        Port ( clk : in STD_LOGIC;
           ADDR : in std_logic_vector(31 downto 0);
           DW : in std_logic_vector(31 downto 0);
           DR : out std_logic_vector(31 downto 0);
           MemRead: in std_logic;
           MemWrite: in std_logic);
    end component;
    
    signal RegWriteOUTMEMWB: std_logic;
    signal memWriteNoimporta: std_logic:= '0';
    signal datoOUT : STD_LOGIC_VECTOR (31 downto 0);
    signal dwNoimporta: std_logic_vector (31 downto 0):= "00000000000000000000000000000000";
    signal direccionEscrituraOUTMEMWB : STD_LOGIC_VECTOR (4 downto 0); --SALIDAS PARA EL REGISTRO MEMWB
    
    signal operacionALU : STD_LOGIC_VECTOR (2 downto 0):= "000";
    signal RegWriteOUTEXMEM,MemReadOUTEXMEM: std_logic;
    signal resultadoALUOUT: STD_LOGIC_VECTOR (31 downto 0);
    signal resultadoOUT : STD_LOGIC_VECTOR (31 downto 0);
    signal direccionEscrituraOUTEXMEM : STD_LOGIC_VECTOR (4 downto 0); --SALIDAS PARA EL REGISTRO EXMEM

signal instruccion_interna: STD_LOGIC_VECTOR (31 downto 0);
signal salidaIFID: STD_LOGIC_VECTOR (31 downto 0);

    signal cop: std_logic_vector (5 downto  0);
    signal reg1: std_logic_vector (4 downto 0);
    signal reg2: std_logic_vector (4 downto 0);
    signal reg3: std_logic_vector (4 downto 0);
    signal sham: std_logic_vector (4 downto 0);
    signal func: std_logic_vector (5 downto 0);
    signal extension: std_logic_vector (15 downto 0);
    
    signal Alu_op: std_logic_vector (1 downto 0);
    
    signal RegWrite,RegDst,ALUSrc,MemtoReg,MemRead,MemWrite: std_logic;
    signal RegWriteOUT1,RegDstOUT,ALUSrcOUT,MemtoRegOUT,MemReadOUT,MemWriteOUT: std_logic;
    signal Alu_opOUT: std_logic_vector (1 downto 0);
    signal RD1OUT : STD_LOGIC_VECTOR (31 downto 0);
    signal direccionEscrituraOUT : STD_LOGIC_VECTOR (4 downto 0);
    signal extSignoOUT : STD_LOGIC_VECTOR (31 downto 0);
    
    signal rw: std_logic_vector (4 downto 0);
    signal busW: std_logic_vector (31 downto 0);
    signal inmediato: std_logic_vector (31 downto 0);
    signal DR: std_logic_vector (31 downto 0);
    signal val1: std_logic_vector (31 downto 0);
    signal val2: std_logic_vector (31 downto 0);
    
    signal resultado: std_logic_vector (31 downto 0);

begin
             
    ALU1: Alu
    port map(A => RD1OUT,
             B => extSignoOUT,
             C => operacionALU,
             SALIDA => resultado);

camino_1: Union
        Port map( clk => clk,
                  reset => reset,
                  instruccion => instruccion_interna);
                  
                  reg: IFID
        Port map( clk => clk,
                  entrada => instruccion_interna,
                  salida => salidaIFID);
                  
        Decodificador: DecodificadorInstrucciones
        port map(
             instruccion => salidaIFID,
             codigoOperacion => cop,
             registro1 => reg1,
             registro2 => reg2,
             resultado => reg3,
             shamt => sham,
             extension => extension,
             funcion => func);
             
             MaquinaDeEstados: MDE
    port map(RegDst => RegDst,
             ALUSrc => ALUSrc,
             MemtoReg => MemtoReg,
             RegWrite => RegWrite,
             MemRead => MemRead,
             MemWrite => MemWrite,
             op => cop,
             Aluop => Alu_op);
             
    rm: ram
    port map(clk => clk,
             addr1 => reg1,
             addr2 => reg2,
             addr3 => direccionEscrituraOUTMEMWB,
             Escribir => RegWriteOUTMEMWB,
             resultadoOP => datoOUT,
             valor1 => val1,
             valor2 => val2);
             
    ExtensionSig: ExtensionSigno
    port map(inm => extension,
             inmed => inmediato);
             
    registro2IDEX: IDEX
    port map(clk => clk,
             RegWrite => RegWrite, --Estas senales llegan de la MDE
             MemRead => MemRead, --Estas senales llegan de la MDE
             Aluop => Alu_op, --Estas senales llegan de la MDE
             RD1 => val1, -- llega de la ram 
             direccionEscritura => reg2, -- llega de la ram 
             extSigno => inmediato, --Estas senales llegan de la MDE 
             RegWriteOUT => RegWriteOUT1,
             MemReadOUT => MemReadOUT,
             AluopOUT => Alu_opOUT,
             RD1OUT => RD1OUT,
             direccionEscrituraOUT => direccionEscrituraOUT,
             extSignoOUT => extSignoOUT
             );
    
    registroEXMEM: EXMEM
    port map(clk => clk,
             RegWrite => RegWriteOUT1,
             MemRead => MemReadOUT,
             resultadoALU => resultado,
             direccionEscritura => direccionEscrituraOUT,
             direccionEscOUT => direccionEscrituraOUTEXMEM,
             RegWriteOUT => RegWriteOUTEXMEM,
             MemReadOUT => MemReadOUTEXMEM,
             resultadoOUT => resultadoOUT
                );
                
    MemDatos: MemoriaDeDatos
    port map(clk => clk,
             ADDR => resultadoOUT,
             DW => dwNoimporta,
             DR => DR,
             MemRead => MemReadOUTEXMEM,
             MemWrite => memWriteNoimporta);
             
    registroMEMWB: MEMWB
    port map(clk => clk,
             RegWrite => RegWriteOUT1,
             dato => DR,
             direccionEscritura => direccionEscrituraOUTEXMEM,
             direccionEscOUT => direccionEscrituraOUTMEMWB,
             RegWriteOUT => RegWriteOUTMEMWB,
             datoOUT => datoOUT
                );

end Behavioral;
