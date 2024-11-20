----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 12:11:58
-- Design Name: 
-- Module Name: Union_Ram_Decodificador_Suma - Behavioral
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

entity Union2 is
    Port ( clk : in STD_LOGIC;
           SumaInstruccion : in STD_LOGIC_VECTOR (4 downto 0); -- Instruccion siguiente de PC
           nuevaInstruccion : out STD_LOGIC_VECTOR (4 downto 0);
           instruccion : in STD_LOGIC_VECTOR (31 downto 0));
end Union2;

architecture Behavioral of Union2 is

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
    
    component ctrlAlu
         Port ( ALUop : in STD_LOGIC_VECTOR (2 downto 0);
           funcion : in STD_LOGIC_VECTOR (5 downto 0);
           operacion : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Alu
       Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           zero: out std_logic;
           SALIDA : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component RegistroALU
        Port ( clk : in STD_LOGIC;
           valor_entrada : in STD_LOGIC_VECTOR (31 downto 0);
           valor_salida : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MDE
       Port ( RegDst : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           branch: out std_logic;
           jump: out std_logic;
           op : in STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component multiplexor5bits
        Port ( rt : in STD_LOGIC_VECTOR (4 downto 0);
           rd : in STD_LOGIC_VECTOR (4 downto 0);
           rw : out STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in STD_LOGIC);
    end component;
    
    component multiplexor32bitsALUSrc
        Port ( busB : in STD_LOGIC_VECTOR (31 downto 0);
           inmed : in STD_LOGIC_VECTOR (31 downto 0);
           rw : out STD_LOGIC_VECTOR (31 downto 0);
           ALUSrc : in STD_LOGIC);
    end component;
    
    component MemoriaDeDatos
        Port ( clk : in STD_LOGIC;
           ADDR : in std_logic_vector(31 downto 0);
           DW : in std_logic_vector(31 downto 0);
           DR : out std_logic_vector(31 downto 0);
           MemRead: in std_logic;
           MemWrite: in std_logic);
    end component;
    
    component multiplexor32bitsMemtoReg
        Port ( DR : in STD_LOGIC_VECTOR (31 downto 0);
           salidaALU : in STD_LOGIC_VECTOR (31 downto 0);
           busW : out STD_LOGIC_VECTOR (31 downto 0);
           MemtoReg : in STD_LOGIC);
    end component;
    
    component ExtensionSigno
        Port ( inm : in STD_LOGIC_VECTOR (15 downto 0);
           inmed : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component multiplexorSaltosPCSrc
        Port ( zero : in STD_LOGIC;
           branch : in STD_LOGIC;
           PC : in STD_LOGIC_VECTOR (4 downto 0);
           Inmediato : in STD_LOGIC_VECTOR (4 downto 0);
           salidaPCSrcs : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component muxJump
        Port ( sumaPC : in STD_LOGIC_VECTOR (4 downto 0);
           inmediato : in STD_LOGIC_VECTOR (4 downto 0);
           jump : in STD_LOGIC;
           nuevaInstruccion : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal cop: std_logic_vector (5 downto  0);
    signal reg1: std_logic_vector (4 downto 0);
    signal reg2: std_logic_vector (4 downto 0);
    signal reg3: std_logic_vector (4 downto 0);
    signal sham: std_logic_vector (4 downto 0);
    signal func: std_logic_vector (5 downto 0);
    
    signal resultado: std_logic_vector (31 downto 0);
    signal valorALU: std_logic_vector (31 downto 0);
    signal val1: std_logic_vector (31 downto 0);
    signal val2: std_logic_vector (31 downto 0);
    signal Alu_op: std_logic_vector (2 downto 0);
    signal operacion_out: std_logic_vector (2 downto 0);
    
    signal rw: std_logic_vector (4 downto 0);
    signal valorBALU: std_logic_vector (31 downto 0);
    signal busW: std_logic_vector (31 downto 0);
    signal inmediato: std_logic_vector (31 downto 0);
    signal extension: std_logic_vector (15 downto 0);
    signal DR: std_logic_vector (31 downto 0);
    
    signal ins_reducida: std_logic_vector (4 downto 0);
    signal salidaPCSrcs: std_logic_vector (4 downto 0); 
    
    
    signal RegWrite,RegDst,ALUSrc,MemtoReg,MemRead,MemWrite, branch, jump, zero: std_logic;
begin

   Decodificador: DecodificadorInstrucciones
    port map(
             instruccion => instruccion,
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
             branch => branch,
             jump => jump,
             Aluop => Alu_op);
    
    rm: ram
    port map(clk => clk,
             addr1 => reg1,
             addr2 => reg2,
             addr3 => rw,
             Escribir => RegWrite,
             resultadoOP => busW,
             valor1 => val1,
             valor2 => val2);
             
             
    control_ALU: ctrlAlu
    port map( AlUOP => Alu_op,
              funcion => func,
              operacion => operacion_out
                );
             
    ALU1: Alu
    port map(A => val1,
             B => valorBALU,
             C => operacion_out,
             zero => zero,
             SALIDA => resultado);
             
    MuxRegDst: multiplexor5bits
    port map(rt => reg2,
             rd => reg3,
             rw => rw,
             RegDst => RegDst);
             
    MuxALUSrc: multiplexor32bitsALUSrc
    port map(busB => val2,
             inmed => inmediato,
             rw => valorBALU,
             ALUSrc => ALUSrc);
             
    ExtensionSig: ExtensionSigno
    port map(inm => extension,
             inmed => inmediato);
             
    MemDatos: MemoriaDeDatos
    port map(clk => clk,
             ADDR => resultado,
             DW => val2,
             DR => DR,
             MemRead => MemRead,
             MemWrite => MemWrite);
             
    MuxMemtoReg: multiplexor32bitsMemtoReg
    port map(DR => DR,
             salidaALU => resultado,
             busW => busW,
             MemtoReg => MemtoReg);
             
    reg_alu: RegistroALU
    port map(clk => clk,
             valor_entrada => resultado,
             valor_salida => valorALU);
             
    MuxPCSrc: multiplexorSaltosPCSrc
    port map(branch => branch,
             Inmediato => inmediato(4 downto 0),
             zero => zero,
             PC => SumaInstruccion,
             salidaPCSrcs => salidaPCSrcs
                );
    
    MultiplexorJump: muxJump
    port map(jump => jump,
             inmediato => salidaPCSrcs,
             sumaPC => SumaInstruccion,
             nuevaInstruccion => nuevaInstruccion);

    
end Behavioral;
