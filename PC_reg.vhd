library ieee;
use ieee.std_logic_1164.all;

Entity PC_reg is 
generic (
	n: integer := 16
);
port (
	clk, PC_clr : in std_logic;
	escolhido : in std_logic_vector(n-1 downto 0);
	saida : out std_logic_vector(n-1 downto 0)
);
end PC_reg ;
architecture arq of PC_reg is
 begin
	 process(clk)
		begin
			if (PC_clr = '0') then 
				saida <= (others=>'0');
			elsif (clk'event and clk = '1') then 
					saida <= escolhido ;
					end if;
	end process;
 end arq;