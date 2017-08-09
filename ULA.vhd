library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity ULA is 
generic(
	n: integer := 16
);
port (
	Sel_ula : in std_logic_vector(2 downto 0);
	Rp_data, Rq_data : in std_logic_vector(n-1 downto 0);
	saida : out std_logic_vector(n-1 downto 0)
);
end ULA ;
architecture arq of ULA is
	signal sadd, ssub, sory, sxory, sxnory, sshftL, sshftR, sandy : std_logic_vector(n-1 downto 0);
	
	component add 
	generic (
		n: integer := 16
	);
	 port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component sub 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component andy 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component xnory 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component xory 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component ory 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component shftL 
	generic (
		n: integer := 16
	);
	port (
		ent : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component shftR 
	generic (
		n: integer := 16
	);
	port (
		ent : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component;
	
	component mux_ULA 
	generic (
		n : integer := 16
	);
	port (
		Sel_ula : in std_logic_vector(2 downto 0);
		add, andy, ory, xory, xnory, sub, shftL, shftR : in std_logic_vector(n-1 downto 0);
		d : out std_logic_vector(n-1 downto 0)
	);
	end component;

 begin
i1: add generic map (16) port map (Rp_data, Rq_data, sadd);
i2: sub generic map (16) port map (Rp_data, Rq_data, ssub);
i3: andy generic map (16) port map (Rp_data, Rq_data, sandy);
i4: ory generic map (16) port map (Rp_data, Rq_data, sory);
i5: xory generic map (16) port map (Rp_data, Rq_data, sxory);
i6: xnory generic map (16) port map (Rp_data, Rq_data, sxnory);
i7: shftL generic map (16) port map (Rp_data, sshftL);
i8: shftR generic map (16) port map (Rp_data, sshftR);
i9: mux_ULA generic map (16) port map (Sel_ula, sadd, sandy, sory, sxory, sxnory, ssub, sshftL, sshftR, saida);
end arq;