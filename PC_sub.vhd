library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity PC_sub is
 generic (
	n: integer := 8
 );
 port (
	out_SOMA : in std_logic_vector(n-1 downto 0);
	out_SUB : out std_logic_vector(n-1 downto 0)
 );
end PC_sub ;
architecture arq of PC_sub is
 begin
	out_SUB <= out_SOMA - (std_logic_vector(to_unsigned(1, out_SOMA'length)));
 end arq;