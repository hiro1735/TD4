library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package BPAC is
	function chatter (CLK : STD_LOGIC;
							RST : STD_LOGIC;
							SW : STD_LOGIC)
							return STD_LOGIC;							
end BPAC;

package body BPAC is
	function chatter (CLK : STD_LOGIC;
							RST : STD_LOGIC;
							SW : STD_LOGIC)
							return STD_LOGIC is
							
	variable clk_cnt : integer range 0 to 10000;
	constant ct : integer := 9999;
	variable sw_o : std_logic;
	
begin

	if(RST = '1')then
		clk_cnt := 0;
	elsif(CLK'event and CLK='1')then
		if(SW = '1')then
			if(clk_cnt = ct)then
				clk_cnt := clk_cnt + 1;
			end if;
		else
			clk_cnt := 0;
		end if;
	end if;
	
	sw_o := '1' when clk_cnt = ct else '0';
	return sw_o;

end BPAC;