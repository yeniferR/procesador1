--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:49 04/13/2016
-- Design Name:   
-- Module Name:   C:/Users/Yenifer Rivas Moreno/Desktop/Nueva carpeta (2)/procesador1/procesadorMonociclo/nPc_TB.vhd
-- Project Name:  procesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY nPc_TB IS
END nPc_TB;
 
ARCHITECTURE behavior OF nPc_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPc
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         nextInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal clkFPGA : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal nextInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkFPGA_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPc PORT MAP (
          address => address,
          clkFPGA => clkFPGA,
          reset => reset,
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
