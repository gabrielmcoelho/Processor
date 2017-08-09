library ieee;
use ieee.std_logic_1164.all;

Entity PO is 
port (
	D_wr, clk, W_wr, Rp_rd, Rq_rd, Sel_Rg : in std_logic;
	Sel_RF : in std_logic_vector(1 downto 0);
	Sel_Ula : in std_logic_vector(2 downto 0);
	W_addr, Rp_addr, Rq_addr : in std_logic_vector(3 downto 0);
	D_addr: in std_logic_vector(7 downto 0);
	ctte : in std_logic_vector(15 downto 0);
	saida : out std_logic;
	smux, enmem: out std_LOGIC_VECTOR(15 downto 0)
);

end PO ;
architecture arq of PO is
	signal s1, s2, s3, s4, s5 : std_logic_vector(15 downto 0);
	signal s6 : std_logic_vector(7 downto 0);
	 
	component mux_MEM
	port (
		Sel_rg : in std_logic;
		D_addr : in std_logic_vector(7 downto 0); 
		Rp_data : in std_logic_vector(15 downto 0);
		C_data : out std_logic_vector(7 downto 0)
	);
	end component ;
	 
	component compZero 
	port (
		Rp_data : in std_logic_vector(15 downto 0);
		saida : out std_logic
	);
	end component ;
	
	component mux_RF 
	port (
		Sel_rf : in std_logic_vector(1 downto 0);
		ULA, R_data, ctte: in std_logic_vector(15 downto 0);
		W_data : out std_logic_vector(15 downto 0)
	);
	end component ;
	
	component ULA
	generic(
		n: integer := 16
	);
	port (
		Sel_ula : in std_logic_vector(2 downto 0);
		Rp_data, Rq_data : in std_logic_vector(n-1 downto 0);
		saida : out std_logic_vector(n-1 downto 0)
	);
	end component ;
	
	component RF
	port (
		W_addr, Rp_addr, Rq_addr : in std_logic_vector(3 downto 0); -- saidas do controller
		W_wr, Rp_rd, Rq_rd, clk : in std_logic;
		W_data : in std_logic_vector(15 downto 0); --saida do mux
		Rp_data, Rq_data : out std_logic_vector(15 downto 0)
	);
	end component ;
	
	component memdy
	port
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	end component;
	
 begin

i1: memdy port map (s6, clk, s3, D_wr, s1);
i2: mux_RF port map (Sel_rf, s5, s1, ctte, s2);
i3: RF port map (W_addr, Rp_addr, Rq_addr, W_wr, Rp_rd, Rq_rd, clk, s2, s3, s4);
i4: ULA generic map (16) port map (Sel_ula, s3, s4, s5);
i5: compZero port map (s3, saida);
i6: mux_MEM port map (Sel_Rg, D_addr, s3, s6);

smux <= s2;
enmem <= s3;
	
 end arq;