library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC_mux is
 generic (
	n: integer := 16
 );
 port (
	out_SUB, soma : in std_logic_vector(n-1 downto 0);
	PC_jump : in std_logic;
	escolhido : out std_logic_vector(n-1 downto 0)
 );
end PC_mux ;
architecture arq of PC_mux is
 begin
	escolhido <= out_SUB when PC_jump = '1' else
					 soma; 
 end arq;