library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
Entity mux_RF is 
port (
	Sel_rf : in std_logic_vector(1 downto 0);
	ULA, R_data, ctte: in std_logic_vector(15 downto 0);
	W_data : out std_logic_vector(15 downto 0)
);
end mux_RF ;
architecture arq of mux_RF is
 begin
	W_data <= ULA    when Sel_rf = "00" else
				 R_data when Sel_rf = "01" else 
		       ctte   when Sel_rf = "10";
 end arq;