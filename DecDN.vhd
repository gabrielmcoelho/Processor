library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity DecDN is
 port (
	OP : in std_logic_vector(3 downto 0);
	i3, i2, i1, i0 : out std_logic_vector(6 downto 0)
 );
end DecDN ;
architecture arq of DecDN is
 begin  --gfedcba
	i3 <= "1000111" when OP = "0000" else "0010010" when OP = "0001" else
			"1111111" when OP = "0010" else "1000111" when OP = "0011" else
			"1111111" when OP = "0100" else "1100001" when OP = "0101" else
			"1111111" when OP = "0110" else "1111111" when OP = "0111" else
			"1111111" when OP = "1000" else "0001001" when OP = "1001" else
			"0010010" when OP = "1010" else "0010010" when OP = "1011" else
			"1100001" when OP = "1100" else "1000111" when OP = "1101";
		  --gfedcba
	i2 <= "0100011" when OP = "0000" else "0000111" when OP = "0001" else
			"0001000" when OP = "0010" else "0100001" when OP = "0011" else
			"0010010" when OP = "0100" else "0110000" when OP = "0101" else
			"0001000" when OP = "0110" else "1111111" when OP = "0111" else
			"0001001" when OP = "1000" else "0101011" when OP = "1001" else
			"0001011" when OP = "1010" else "0001011" when OP = "1011" else
			"1100011" when OP = "1100" else "0100001" when OP = "1101";
			--gfedcba
	i1 <= "0100000" when OP = "0000" else "1001110" when OP = "0001" else
			"0100001" when OP = "0010" else "1000110" when OP = "0011" else
			"1100011" when OP = "0100" else "0001100" when OP = "0101" else 
			"0101011" when OP = "0110" else "1000000" when OP = "0111" else 
			"0100011" when OP = "1000" else "0100011" when OP = "1001" else
			"0001110" when OP = "1010" else "0001110" when OP = "1011" else
			"0110000" when OP = "1100" else "1001110" when OP = "1101";
			--gfedcba
	i0 <= "0100001" when OP = "0000" else "0000100" when OP = "0001" else
			"0100001" when OP = "0010" else "0000111" when OP = "0011" else
			"0000011" when OP = "0100" else "0100100" when OP = "0101" else
			"0100001" when OP = "0110" else "0101111" when OP = "0111" else
			"0101111" when OP = "1000" else "0101111" when OP = "1001" else
			"1000111" when OP = "1010" else "1001110" when OP = "1011" else
			"0001100" when OP = "1100" else "0010000" when OP = "1101";
 end arq;