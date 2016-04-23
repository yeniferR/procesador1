
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity uc is
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           op3 : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           aluop : out  STD_LOGIC_VECTOR(5 DOWNTO 0));
end uc;

architecture arquc of uc is


begin

process (op, op3)
	begin 
	if (op = "10")then
		case op3 is
			when "000000" => -- ADD
				aluop <= "000000";
			when "000010" => -- OR
				aluop  <= "000010";
			when "000100" => -- SUB
				aluop  <= "000100";
			when "000001" => -- AND
				aluop  <= "000001";
			when "000101" => -- ANDN
				aluop  <= "000101";
			when "000110" => -- ORN
				aluop  <= "000110";
			when "000011" => -- XOR
				aluop  <= "000011";
			when "000111" => -- XNOR
				aluop  <= "000111";
			when others =>
				aluop  <= "000000";
		end case;
	end if;
end process;


end arquc;

