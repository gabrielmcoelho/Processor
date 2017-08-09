library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity xory is
 generic (
	n: integer := 16
 );
 port (
	ent1, ent2 : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end xory ;
architecture arq of xory is
 begin
	res <= (ent1 xor ent2);
 end arq;