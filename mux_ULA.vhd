library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
Entity mux_ULA is 
generic (
 n : integer := 16
);
port (
	Sel_ula : in std_logic_vector(2 downto 0);
	add, andy, ory, xory, xnory, sub, shftL, shftR : in std_logic_vector(n-1 downto 0);
	d : out std_logic_vector(n-1 downto 0)
);
end mux_ULA ;
architecture arq of mux_ULA is
 begin
	d <= add   when Sel_ula = "000" else
		  andy  when Sel_ula = "001" else 
		  ory   when Sel_ula = "010" else
		  xory  when Sel_ula = "011" else
		  xnory when Sel_ula = "100" else
		  sub   when Sel_ula = "101" else
		  shftL when Sel_ula = "110" else
		  shftR when Sel_ula = "111";
 end arq;