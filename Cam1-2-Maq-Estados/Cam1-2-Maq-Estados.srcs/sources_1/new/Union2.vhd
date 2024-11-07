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
           reset : in STD_LOGIC;
           clk_pc : out STD_LOGIC; --Tengo que tener estas dos salidas, que son de la maquina de estados, para poder 
           --comunicarme con el camino 1, y asi indicar a PC y a la memoria de instrucciones cuando se deben activar
           clk_MemInstrucciones : out STD_LOGIC;
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
         Port ( ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           funcion : in STD_LOGIC_VECTOR (5 downto 0);
           operacion : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Alu
       Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
              B : in  STD_LOGIC_VECTOR (31 downto 0);
              C : in  STD_LOGIC_VECTOR (2 downto 0);
              SALIDA : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component RegistroALU
        Port ( clk : in STD_LOGIC;
           valor_entrada : in STD_LOGIC_VECTOR (31 downto 0);
           valor_salida : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MDE
        Port ( clk : in STD_LOGIC;
           clk_pc : out STD_LOGIC;
           clk_MemInstrucciones : out STD_LOGIC;
           clk_RAM : out STD_LOGIC;
           clk_regAlu : out STD_LOGIC;
           RegDst : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           op : in STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC);
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
    signal Alu_op: std_logic_vector (1 downto 0);
    signal operacion_out: std_logic_vector (2 downto 0);
    
    signal clk_RAM,clk_regAlu,RegWrite,RegDst,ALUSrc,MemtoReg,MemRead,MemWrite: std_logic;
begin

   Decodificador: DecodificadorInstrucciones
    port map(
             instruccion => instruccion,
             codigoOperacion => cop,
             registro1 => reg1,
             registro2 => reg2,
             resultado => reg3,
             shamt => sham,
             funcion => func);
    
    MaquinaDeEstados: MDE
    port map(clk => clk,
             clk_pc => clk_pc,
             clk_MemInstrucciones => clk_MemInstrucciones,
             clk_RAM => clk_RAM,
             clk_regAlu => clk_regAlu,
             RegDst => RegDst,
             ALUSrc => ALUSrc,
             MemtoReg => MemtoReg,
             RegWrite => RegWrite,
             MemRead => MemRead,
             MemWrite => MemWrite,
             op => cop,
             Aluop => Alu_op,
             reset => reset
                );
    
    rm: ram
    port map(clk => clk_RAM,
             addr1 => reg1,
             addr2 => reg2,
             addr3 => reg3,
             Escribir => RegWrite,
             resultadoOP => resultado,
             valor1 => val1,
             valor2 => val2);
             
             
    control_ALU: ctrlAlu
    port map( AlUOP => Alu_op,
              funcion => func,
              operacion => operacion_out
                );
             
    ALU1: Alu
    port map(A => val1,
             B => val2,
             C => operacion_out,
             SALIDA => resultado);
             
    reg_alu: RegistroALU
    port map(clk => clk_regAlu,
             valor_entrada => resultado,
             valor_salida => valorALU);

    
end Behavioral;
