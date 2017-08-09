library ieee;
use ieee.std_logic_1164.all;

Entity PROCESSADOR is 
port (
	clk, BT_start, BT_EXEC : in std_logic;
	D3, D2, D1, D0, Inst3, Inst2, Inst1, Inst0 : out std_logic_vector(6 downto 0);
		estado: out STD_logic_vector(4 DOWNTO 0)
);
end PROCESSADOR ;

architecture arq of PROCESSADOR is
	signal s1, s5, s7, s9, s4, s14 : std_logic;
	signal s11 : std_logic_vector(1 downto 0);
	signal s2 : std_logic_vector(2 downto 0);
	signal s10, s8, s6 : std_logic_vector(3 downto 0);
	signal s12 : std_logic_vector(7 downto 0);
	signal s13, s15, s16 : std_logic_vector(15 downto 0);

	component PO 
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

	end component ;

	component PCZAO
	port(
		BT_start, BT_EXEC, saida, clk : in std_logic; -- "saida" é a saida do PO (ou melhor, CompZero)
		W_data, Rp_data : in std_logic_vector(15 downto 0);
		Sel_Rg, D_wr, W_wr, Rp_rd, Rq_rd : out std_logic;
		Sel_RF : out std_logic_vector(1 downto 0);
		Sel_Ula : out std_logic_vector(2 downto 0);
		W_addr, Rp_addr, Rq_addr : out std_logic_vector(3 downto 0);
		D3, D2, D1, D0, Inst3, Inst2, Inst1, Inst0 : out std_logic_vector(6 downto 0);
		D_addr : out std_logic_vector(7 downto 0);
		ctte : out std_logic_vector(15 downto 0);
		estado: out STD_logic_vector(4 DOWNTO 0)
	);
	end component;

begin

i1: PO port map (s14, clk, s9, s7, s5, s4, s11, s2, s10, s8, s6, s12, s13, s1, s16, s15);
i2: PCZAO port map (BT_start,BT_EXEC, s1, clk, s16, s15, s4, s14, s9, s7, s5, s11, s2, s10, 
							s8, s6, D0, D1, D2, D3, Inst3, Inst2, Inst1, Inst0, s12, s13, estado); 
	 
end arq;