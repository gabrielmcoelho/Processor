library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity ory is
 generic (
	n: integer := 16
 );
 port (
	ent1, ent2 : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end ory ;
architecture arq of ory is
 begin
	res <= (ent1 or ent2);
 end arq;