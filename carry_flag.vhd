--キャリーフラグ用レジスタ(ALUの一部）
--入力：CLK,RST,全加算器からのキャリーフラグ(1bit)
--出力：キャリーフラグ(1bit)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity carry_flag is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CARRY : in  STD_LOGIC_VECTOR(1 downto 0);
           FLAG : out  STD_LOGIC);
end carry_flag;

architecture RTL of carry_flag is

	signal c_flag : std_logic;

begin

	FLAG <= c_flag;
	
	process (CLK, RST) begin
		if(RST = '1')then
			c_flag <= '0';
		elsif(rising_edge(CLK))then
			if(CARRY = "01") then
				c_flag <= '1';
			else
				c_flag <= '0';
			end if;
		end if;
	end process;

end RTL;

