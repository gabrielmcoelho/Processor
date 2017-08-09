library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity memi is 
port (
	out_PC: in std_logic_vector(7 downto 0);
	rd: in std_logic;
	Data: out std_logic_vector(15 downto 0)
);
end memi;

architecture arq of memi is
signal inst: std_logic_vector(4095 downto 0);
begin 
		inst(15 downto 0)    <= "0011"& "0001"& "00000001"; -- load constante 1 no R1
		inst(31 downto 16)   <= "0011"& "0010"& "00000010"; -- load constante 2 no R2
		inst(47 downto 32)   <= "0010"& "0011"& "0001"& "0010"; -- add R3 = R1 + R2
		inst(63 downto 48)   <= "0001"& "0011"& "00000001";-- Guarda no 
		inst(79 downto 64)   <= "0000"& "1011"& "00000001";
		inst(95 downto 80)   <= "0100"& "0100"& "1011"& "0001";
		inst(111 downto 96)  <= "0110"& "0101"& "0001"& "0010";
		inst(127 downto 112) <= "0111"& "0110"& "0001"& "0010";
		inst(143 downto 128) <= "1000"& "0111"& "0001"& "0010";
		inst(159 downto 144) <= "1001"& "1000"& "0001"& "0010";
		inst(175 downto 160) <= "1010"& "1001"& "0001"& "0010";
		inst(191 downto 176) <= "1011"& "1010"& "0001"& "0010";
		inst(207 downto 192) <= "1100"& "1111"& "00000010";
		inst(223 downto 208) <= "0010"& "0011"& "0001"& "0010";
		inst(239 downto 224) <= "0101"& "0001"& "00000011";
		inst(255 downto 240) <= "0101"& "1010"& "00000010";
		inst(271 downto 256) <= "0010"& "0011"& "0001"& "0010";
		inst(287 downto 272) <= "1101"& "1100"& "0001"& "1111";
		inst(303 downto 288) <= "0010"& "1101"& "1100"& "0001";
		
		Data <= inst(16*(to_integer(unsigned(out_PC))+1)-1 downto 16*to_integer(unsigned(out_PC))) when rd = '1';
		
end arq;