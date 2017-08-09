library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity shftR is
 generic (
	n: integer := 16
 );
 port (
	ent : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end shftR ;
architecture arq of shftR is
 begin
	res <= '0'&ent(n-1 downto 1);
 end arq;