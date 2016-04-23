
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uc_TB IS
END uc_TB;
 
ARCHITECTURE behavior OF uc_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uc
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal aluop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uc PORT MAP (
          op => op,
          op3 => op3,
          aluop => aluop
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--		op <= "10";
--		
--		op3 <= "000000";
--		wait for 30 ns;
--		op3 <= "000010";
--		wait for 30 ns;
--		op3 <= "010000";
--		wait for 30 ns;
--		op3 <= "000100";

      -- insert stimulus here 

      wait;
   end process;

END;
