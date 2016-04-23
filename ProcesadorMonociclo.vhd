
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProcesadorMonociclo is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Aluresult : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorMonociclo;

architecture Behavioral of ProcesadorMonociclo is


COMPONENT uc
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
   COMPONENT ALU
    PORT(
         operando1 : IN  std_logic_vector(31 downto 0);
         operando2 : IN  std_logic_vector(31 downto 0);
         aluOp : IN  std_logic_vector(5 downto 0);
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
COMPONENT PC
    PORT(
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         nextInstruction : OUT  std_logic_vector(31 downto 0)
        );
		  END COMPONENT;

COMPONENT RegisterFile
    PORT(Clk : IN std_logic;
         Reset : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
    COMPONENT adder
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         outa : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
	COMPONENT nPc
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         nextInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 

signal suma_out : std_logic_vector(31 downto 0);
signal nPC_out : std_logic_vector(31 downto 0) ;
signal PC_out : std_logic_vector(31 downto 0) ;
signal IM_out : std_logic_vector(31 downto 0) ;
signal CU_out  : std_logic_vector(5 downto 0);
signal CRs1 : std_logic_vector(31 downto 0) ;
signal CRs2 : std_logic_vector(31 downto 0) ;
signal salida : std_logic_vector(31 downto 0) ;

begin
-- si algo falla esta aqui
Instr_nPc: nPc PORT MAP (
          address => suma_out,
          clkFPGA => Clk,
          reset => Reset,
          nextInstruction =>nPC_out
        );
		  
Instr_PC: PC PORT MAP (
          clkFPGA => Clk,
          reset => Reset,
          address => nPC_out, 
          nextInstruction => PC_out
        );		  
Instr_adder: adder PORT MAP (
          op1 => "00000000000000000000000000000001",
          op2 => nPC_out,
          outa => suma_out
        );
Instr_Memory: instructionMemory PORT MAP (
          address => PC_out,
          reset => Reset,
          outInstruction => IM_out
        );		  
Instr_uc: uc PORT MAP (
          op => IM_out(31 downto 30),
          op3 => IM_out(24 downto 19),
          aluop => CU_out
        );
Instr_RE: RegisterFile PORT MAP (
			 Clk => Clk,
          Reset => Reset,
          rs1 => IM_out(18 downto 14),
          rs2 => IM_out(4 downto 0),
          rd => IM_out(29 downto 25),
          DWR => salida,
          Crs1 => CRs1,
          Crs2 => CRs2
        );
		  
Instr_ALU: ALU PORT MAP (
          operando1 =>CRs1, 
          operando2 => CRs2,
          aluOp => CU_out,
          AluResult => salida
        );		  
Aluresult<= salida;		  
		  
end Behavioral;

