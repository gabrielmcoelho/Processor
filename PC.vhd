library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity PC is 
	generic (
	n: integer := 16
 );
 port (
	clk, PC_jump, PC_clear : in std_logic;
	out_SUB, PC_inc : in std_logic_vector(n-1 downto 0);
	out_PC : out std_logic_vector(n-1 downto 0)
 );
end PC ;
architecture arq of PC is
	signal s1, s2, s3 : std_logic_vector(7 downto 0);
	
	component PC_mux
	generic (
	n: integer := 16
	);
	 port (
		out_SUB, soma : in std_logic_vector(n-1 downto 0);
		PC_jump : in std_logic;
		escolhido : out std_logic_vector(n-1 downto 0)
	 );
	end component ;
	
	component PC_somador 
	generic (
		n: integer := 16
	 );
	 port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	 );
	end component;
	
	component PC_reg 
	generic (
		n: integer := 16
	);
	port (
		clk, PC_clr : in std_logic;
		escolhido : in std_logic_vector(n-1 downto 0);
		saida : out std_logic_vector(n-1 downto 0)
	);
	end component;
 --- s3 = escolhido
 begin
	i1: PC_reg generic map (8) port map (clk, PC_clear, s3, s1);
	i2: PC_somador generic map (8) port map (s1, PC_inc, s2); ---std_logic_vector(to_unsigned(1, s1'length))
	i3: PC_mux generic map (8) port map (out_SUB, s2, PC_jump, s3);
	out_PC <= s1;
end arq;