library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC_somador is
 generic (
	n: integer := 8
 );
 port (
	ent1, ent2 : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0)
 );
end PC_somador ;
architecture arq of PC_somador is
 begin
	res <= ent1 + ent2; 
 end arq;
 
 