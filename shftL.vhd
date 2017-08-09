library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity shftL is
 generic (
	n: integer := 16
 );
 port (
	ent : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end shftL ;
architecture arq of shftL is
 begin
	res <= ent(n-2 downto 0)& '0';
 end arq;