
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PC_TB IS
END PC_TB;
 
ARCHITECTURE behavior OF PC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         nextInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clkFPGA : std_logic := '0';
   signal reset : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nextInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkFPGA_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clkFPGA => clkFPGA,
          reset => reset,
          address => address,
          nextInstruction => nextInstruction
        );

   -- Clock process definitions
   clkFPGA_process :process
   begin
		clkFPGA <= '0';
		wait for clkFPGA_period/2;
		clkFPGA <= '1';
		wait for clkFPGA_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      reset <= '1';
--      wait for 100 ns;	
--		reset <= '0'; 
--		address <= "00000000000000000000000000000001";       
--		wait for 20 ns;
--		address <= "00000000000000000000000000000010";
--		wait for 20 ns;
--		address <= "00000000000000000000000000000110";
--		wait for 20 ns;
--		reset <= '0'; 

      -- insert stimulus here 

      wait;
   end process;

END;
