library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
Entity mux_DISPLAY is 
port (
	Sel_d : in std_logic_vector(1 downto 0);
	Rp_data, W_data, PC, PC_jump: in std_logic_vector(15 downto 0);
	saida : out std_logic_vector(15 downto 0)
);
end mux_DISPLAY ;
architecture arq of mux_DISPLAY is
 begin
	saida <= Rp_data  when Sel_d = "00" else
				W_data   when Sel_d = "10" else
				PC_jump  when Sel_d = "01" else
				PC       when Sel_d = "11";
 end arq;