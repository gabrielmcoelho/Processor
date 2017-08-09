library ieee;
use ieee.std_logic_1164.all;

entity PCZAO is
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
end PCZAO;

architecture arq of PCZAO is
	signal s2, s3, s7, s8: std_logic;
	signal s10: std_logic_vector(1 downto 0);
	signal s9: std_logic_vector(3 downto 0);
	signal s1, s4, s11, s12, s13, s15: std_logic_vector(7 downto 0);
	signal s5, s6, s14: std_logic_vector(15 downto 0);
	

	component PC
	generic (
		n: integer := 16
	);
	port (
		clk, PC_jump, PC_clear : in std_logic;
		out_SUB, PC_inc : in std_logic_vector(n-1 downto 0);
		out_PC : out std_logic_vector(n-1 downto 0)
	);
	end component ;
	
	component memi  
	port (
		out_PC: in std_logic_vector(7 downto 0);
		rd: in std_logic;
		Data: out std_logic_vector(15 downto 0)
	);
	end component;
	
	component IR 
	generic (
		n: integer := 16
	);
	port (
		Data : in std_logic_vector(n-1 downto 0);
		IR_ld, clk : in std_logic;
		out_IR : out std_logic_vector(n-1 downto 0)
	);
	end component ;
	
	component Controller
	PORT (
		BT_start, BT_EXEC, clock, comp: IN  std_logic;
		
		out_IR : IN std_logic_vector(15 DOWNTO 0);
		rd, PC_jump, PC_clr, IR_ld, W_wr, Rp_rd, Rq_rd, Sel_Rg, D_wr : OUT STD_LOGIC;
		Sel_RF, SelD : OUT STD_logic_vector(1 DOWNTO 0);
		Sel_Ula : OUT STD_logic_vector(2 DOWNTO 0);
		DN, W_addr, Rp_addr, Rq_addr : OUT STD_logic_vector(3 DOWNTO 0); ---DN É A ENTRADA P/ O DECDN
		D_addr, PC_inc: OUT STD_logic_vector(7 DOWNTO 0);
		ctte : OUT STD_logic_vector(15 DOWNTO 0);
		estado: out STD_logic_vector(4 DOWNTO 0)
	);
	END component;
	
	component DecDN
	port (
		OP : in std_logic_vector(3 downto 0);
		i3, i2, i1, i0 : out std_logic_vector(6 downto 0)
	);
	end component ;
	
	component mux_DISPLAY  
	port (
		Sel_d : in std_logic_vector(1 downto 0);
		Rp_data, W_data, PC, PC_jump: in std_logic_vector(15 downto 0);
		saida : out std_logic_vector(15 downto 0)
	);
	end component ;
	
	component segmentos
	PORT (entrada : IN STD_LOGIC_VECTOR(15 DOWNTO 0);        
        saida1, saida2, saida3, saida4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); 
	END component;
	
	component SOMA
	 port ( 
		out_IR : in std_logic_vector(15 downto 0);
		out_PC : in std_logic_vector(7  downto 0); 
		out_SOMA : out std_logic_vector(7 downto 0)
	 );
	end component ;
	
	component SUB 
	generic (
		n: integer := 16
	);
	port (
		ent1, ent2 : in std_logic_vector(n-1 downto 0);
		res : out std_logic_vector(n-1 downto 0)
	);
	end component ;
	
begin

i1: PC generic map (8) port map (clk, s2, s3, s12, s1, s4);
i2: memi port map (s4, s8, s5);
i3: IR generic map (16) port map (s5, s7, clk, s6);
i4: Controller port map (BT_start, BT_EXEC, clk, saida, s6, s8, s2, s3, s7, W_wr, Rp_rd, Rq_rd, Sel_Rg, D_wr,
									Sel_RF, s10, Sel_Ula, s9, W_addr, Rp_addr, Rq_addr, D_addr, s1, ctte, estado);
i5: DecDN port map (s9, Inst3, Inst2, Inst1, Inst0);
i6: mux_DISPLAY port map (s10, Rp_data, W_data, "00000000" & s4, "00000000" & s15, s14);
i7: segmentos port map (s14, D3, D2, D1, D0);
i8: SOMA port map (s6, s4, s11);
i9: SUB generic map (8) port map (s11, "00000001", s12);

i10: SOMA port map ("00000000"&s4, "00000001", s15);


end arq;
