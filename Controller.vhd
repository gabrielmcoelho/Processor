LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Controller IS
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
END Controller;

ARCHITECTURE Behavior OF controller IS

	CONSTANT I : STD_LOGIC_VECTOR(4 DOWNTO 0)      := "00000"; -- INICIAL
	CONSTANT FETCH : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "00001"; 
	CONSTANT DECODE : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
	CONSTANT LOAD : STD_LOGIC_VECTOR(4 DOWNTO 0)   := "00011"; 
	CONSTANT STORE : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "00100"; -- 
	CONSTANT ADD : STD_LOGIC_VECTOR(4 DOWNTO 0)    := "00101"; -- 
	CONSTANT LD_CTE : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00110"; -- 
	CONSTANT SUB : STD_LOGIC_VECTOR(4 DOWNTO 0)    := "00111"; -- 
	CONSTANT JUMPZ : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "01000"; -- 
	CONSTANT JUMPZ_J : STD_LOGIC_VECTOR(4 DOWNTO 0):= "01001"; -- 
	CONSTANT JPEG : STD_LOGIC_VECTOR(4 DOWNTO 0)   := "01010"; -- 
	CONSTANT SHFTL : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "01011"; -- 
	CONSTANT SHFTR : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "01100"; -- 
	CONSTANT ANDY : STD_LOGIC_VECTOR(4 DOWNTO 0)   := "01101"; -- 
	CONSTANT ORY : STD_LOGIC_VECTOR(4 DOWNTO 0)    := "01110"; -- 
	CONSTANT XORY : STD_LOGIC_VECTOR(4 DOWNTO 0)   := "01111"; -- 
	CONSTANT XNORY : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "10000"; -- 
	CONSTANT JMP : STD_LOGIC_VECTOR(4 DOWNTO 0)    := "10001"; -- 
	CONSTANT LD_RG : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "10010"; -- 
	
	CONSTANT EXTRA1 : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "10011"; -- 
	CONSTANT EXTRA2 : STD_LOGIC_VECTOR(4 DOWNTO 0)  := "10100"; -- 
	
	SIGNAL
	y : STD_LOGIC_VECTOR(4 DOWNTO 0) := I;
	signal OP, ra, rb, rc: std_LOGIC_VECTOR(3 downto 0);
	signal d, c: std_LOGIC_VECTOR(7 downto 0);
	
	BEGIN
	
	OP <= out_IR(15 downto 12);
	ra <= out_IR(11 downto 8);
	rb <= out_IR(7 downto 4);
	rc <= out_IR(3 downto 0);
	d <= out_IR(7 downto 0);
	c <= out_IR(7 downto 0);
	
	estado <= y;
	
	PROCESS (BT_start, clock, BT_EXEC)
		BEGIN
			IF (clock'EVENT AND clock = '1') THEN
			CASE y IS
				WHEN I =>
					IF BT_start='0' THEN
						y <= FETCH;
					END IF;
				WHEN FETCH =>
					   y <= DECODE;
				WHEN DECODE =>
					IF (BT_EXEC = '0' and OP = "0000") THEN
						y <= LOAD;
					ELSIF (BT_EXEC = '0' and OP = "0001") THEN
						y <= STORE;
					ELSIF (BT_EXEC = '0' and OP = "0010") THEN
						y <= ADD;
					ELSIF (BT_EXEC = '0' and OP = "0011") THEN
						y <= LD_CTE;
					ELSIF (BT_EXEC = '0' and OP = "0100") THEN
						y <= SUB;
					ELSIF (BT_EXEC = '0' and OP = "0101") THEN
						y <= JUMPZ;
					ELSIF (BT_EXEC = '0' and OP = "0110") THEN
						y <= ANDY;
					ELSIF (BT_EXEC = '0' and OP = "0111") THEN
						y <= ORY;
					ELSIF (BT_EXEC = '0' and OP = "1000") THEN
						y <= XORY;
					ELSIF (BT_EXEC = '0' and OP = "1001") THEN
						y <= XNORY;
					ELSIF (BT_EXEC = '0' and OP = "1010") THEN
						y <= SHFTL;
					ELSIF (BT_EXEC = '0' and OP = "1011") THEN
						y <= SHFTR;
					ELSIF (BT_EXEC = '0' and OP = "1100") THEN
						y <= JMP;
					ELSIF (BT_EXEC = '0' and OP = "1101") THEN
						y <= LD_RG;
					END IF;
					WHEN JUMPZ =>
						y <= EXTRA1;
					WHEN LOAD =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN STORE =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN ADD =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN LD_CTE =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN SUB =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN SHFTL =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN SHFTR =>
					IF (BT_start = '0') THEN 
						y <= FETCH;
					END IF;
					WHEN ANDY =>
					IF (BT_start = '0') THEN 
						y <= FETCH;
					END IF;
					WHEN ORY =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN XORY =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN XNORY =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN JMP =>
					y <= jpeG;
					WHEN JPEG =>
					IF (BT_start = '0') THEN
						y <= FETCH;
					END IF;
					WHEN JUMPZ_J =>
						y <= JPEG;
						
					WHEN EXTRA1 =>
						IF (comp = '1') THEN
							y <= JUMPZ_J;
						ELSIF (comp = '0') THEN
							y <= JPEG; 
						END IF;
						
					WHEN LD_RG =>
						--IF (BT_start = '0') THEN
						--	y <= FETCH;
						--END IF;
						y <= EXTRA2;
					WHEN EXTRA2 =>
						IF (BT_start = '0') THEN
							y <= FETCH;
						END IF;

				WHEN OTHERS =>
		 END CASE;
	END IF;
END PROCESS;
	
	---SAIDAS
	IR_ld <= '1' WHEN y = FETCH ELSE '0';
	--PC_clr <= '0' WHEN y = I ELSE '1';
	PC_clr <= '1';
	PC_inc <= "00000001" WHEN y = FETCH ELSE "00000000";
	PC_jump <= '1' WHEN y = JMP OR y = JUMPZ_J ELSE '0';
	W_wr <= '1' WHEN y = ORY OR y = LOAD OR y = ADD OR y = LD_CTE OR y = SUB OR y = ANDY OR y = XORY OR y = XNORY OR y = SHFTL OR y = SHFTR OR y = LD_RG OR y = EXTRA2 ELSE '0';
	Rp_rd <= '1' WHEN y = ORY OR y = STORE OR y = ADD OR y = SUB OR y = JUMPZ OR y = ANDY OR y = XORY OR y = XNORY OR y = SHFTL OR y = SHFTR OR y = LD_RG OR y = EXTRA2 ELSE '0';
	Rq_rd <= '1' WHEN y = ORY OR y = ADD OR y = SUB OR y = ANDY OR y = XORY OR y = XNORY ELSE '0';
	Sel_Rg <= '1' WHEN y = LD_RG OR y = EXTRA2 ELSE '0';
	D_wr <= '1' WHEN y = STORE ELSE '0';
	Sel_RF <= "01" WHEN y = LOAD OR y = LD_RG OR y = EXTRA2 ELSE "10" WHEN y = LD_CTE ELSE "00"; 
	SelD <= "11" WHEN y = DECODE ELSE "01" WHEN y = JMP OR y = JPEG ELSE "00" WHEN y = STORE ELSE "10";
	
	Sel_Ula <= "000" WHEN y = ADD ELSE "101" WHEN y = SUB ELSE "001" WHEN y = ANDY ELSE
				  "010" WHEN y = ORY ELSE "011" WHEN y = XORY ELSE "100" WHEN y = XNORY ELSE
				  "110" WHEN y = SHFTL ELSE "111" WHEN y = SHFTR;
	
	DN <= "0000" WHEN y = LOAD ELSE "0001" WHEN y = STORE ELSE "0010" WHEN y = ADD ELSE
			"0011" WHEN y = LD_CTE ELSE "0100" WHEN y = SUB ELSE "0101" WHEN y = JUMPZ ELSE
			"0110" WHEN y = ANDY ELSE "0111" WHEN y = ORY ELSE "1000" WHEN y = XORY ELSE
			"1001" WHEN y = XNORY ELSE "1010" WHEN y = SHFTL ELSE "1011" WHEN y = SHFTR ELSE
			"1100" WHEN y = JMP ELSE "1101" WHEN y = LD_RG OR y = EXTRA2 ELSE op WHEN y = DECODE; 
	
	W_addr <= ra WHEN y = ORY OR y = ADD OR y = SUB OR y = ANDY OR y = XORY OR y = XNORY OR y = LOAD OR y = LD_CTE OR y = SHFTL OR y = SHFTR OR y = LD_RG OR y = EXTRA2;
	Rp_addr <= ra WHEN y = STORE OR y = JUMPZ ELSE rb WHEN y = ADD OR y = SUB OR y = ANDY OR y = ORY OR y = XORY OR y = XNORY OR y = SHFTL OR y = SHFTR OR y = LD_RG OR y = EXTRA2;
	Rq_addr <= rc WHEN y = ADD OR y = SUB OR y = ANDY OR y = ORY OR y = XORY OR y = XNORY;
		
	D_addr <= d WHEN y = LOAD OR y = STORE OR y = LD_RG OR y = EXTRA2;
	
	rd <= '1' WHEN y = FETCH ELSE '0';
	
	ctte <= "00000000"&c WHEN y = LD_CTE;	
	
END Behavior;