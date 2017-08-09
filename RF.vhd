library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity RF is 
port (
	W_addr, Rp_addr, Rq_addr : in std_logic_vector(3 downto 0); -- saidas do controller
	W_wr, Rp_rd, Rq_rd, clk : in std_logic;
	W_data : in std_logic_vector(15 downto 0); --saida do mux
	Rp_data, Rq_data : out std_logic_vector(15 downto 0)
);
end RF ;
architecture arq of RF is

signal reg: std_logic_vector(255 downto 0);

--- reg (16*(to_integer(unsigned(addr)+1))-1 downto 16*to_integer(addr);

 begin
	 process(clk)
		begin
			if (clk'event and clk = '1') then
				if(W_wr = '1') then
					reg (16*(to_integer(unsigned(W_addr))+1)-1 downto 16*to_integer(unsigned(W_addr))) <= W_data;
				end if;
				if(Rp_rd = '1') then 
					RP_data <= reg (16*(to_integer(unsigned(Rp_addr))+1)-1 downto 16*to_integer(unsigned(Rp_addr)));
				end if;
				if(Rq_rd = '1') then
					Rq_data <= reg (16*(to_integer(unsigned(Rq_addr))+1)-1 downto 16*to_integer(unsigned(Rq_addr)));
				end if;
			end if;
	end process;
 end arq;