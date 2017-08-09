library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity xnory is
 generic (
	n: integer := 16
 );
 port (
	ent1, ent2 : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end xnory ;
architecture arq of xnory is
 begin
	res <= (ent1 xnor ent2);
 end arq;