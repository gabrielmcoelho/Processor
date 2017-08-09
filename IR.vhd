library ieee;
use ieee.std_logic_1164.all;

Entity IR is 
generic (
	n: integer := 16
);
port (
	Data : in std_logic_vector(n-1 downto 0);
	IR_ld, clk : in std_logic;
	out_IR : out std_logic_vector(n-1 downto 0)
);
end IR ;
architecture arq of IR is
 begin
	 process(clk)
		begin
			if (clk'event and clk = '1' and IR_ld = '1') then 
					out_IR <= Data;
				end if;
	end process;
 end arq;