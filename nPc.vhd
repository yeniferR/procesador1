
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity nPc is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           clkFPGA : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           nextInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end nPc;

architecture arqnPc of nPc is

begin
	process(clkFPGA,reset,address)
	begin
		
			if(reset = '1')then
				nextInstruction <= (others=>'0');
			else
					if(rising_edge(clkFPGA))then
						nextInstruction <= address;
			end if;
		end if;
	end process;
end arqnPc;

