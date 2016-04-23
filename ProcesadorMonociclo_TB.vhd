
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ProcesadorMonociclo_TB IS
END ProcesadorMonociclo_TB;
 
ARCHITECTURE behavior OF ProcesadorMonociclo_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorMonociclo
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Aluresult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Aluresult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorMonociclo PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Aluresult => Aluresult
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Reset <= '1';
     wait for 100 ns;	
		Reset <= '0'; 

      -- insert stimulus here 

      wait;
   end process;

END;
