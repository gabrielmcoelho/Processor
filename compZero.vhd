library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
Entity compZERO is 
port (
	Rp_data : in std_logic_vector(15 downto 0);
	saida : out std_logic
);
end compZERO ;
architecture arq of compZERO is
 begin
	saida <= '1' when RP_data = std_logic_vector(to_unsigned(0, RP_data'length)) else
				'0';
 end arq;