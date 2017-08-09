library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
Entity mux_MEM is 
port (
	Sel_rg : in std_logic;
	D_addr : in std_logic_vector(7 downto 0); 
	Rp_data : in std_logic_vector(15 downto 0);
	C_data : out std_logic_vector(7 downto 0)
);
end mux_MEM ;
architecture arq of mux_MEM is
	signal opt : std_logic_vector(7 downto 0);
 begin
	opt <= RP_data(7 downto 0);
 
	C_data <= D_addr  when Sel_rg = '0' else
				 opt when Sel_rg = '1';
 end arq;