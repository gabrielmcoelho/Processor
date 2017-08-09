library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
entity SOMA is
 port ( 
	out_IR : in std_logic_vector(15 downto 0);
	out_PC : in std_logic_vector(7  downto 0); 
	out_SOMA : out std_logic_vector(7 downto 0)
 );
end SOMA ;
architecture arq of SOMA is
signal o : std_logic_vector(7 downto 0);
 begin
 o <= out_IR(7 downto 0);
	out_SOMA <= o + out_PC;
 end arq;