--データセレクタ
--入力：A,Bレジスタ、スライドスイッチ、0000 (4bit)
--出力：ALU(4bit)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_selector is
    Port ( IN_A : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_B : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_SW : in  STD_LOGIC_VECTOR(3 downto 0);
           SEL_A : in  STD_LOGIC;
           SEL_B : in  STD_LOGIC;
           OUT_Y : out  STD_LOGIC_VECTOR(3 downto 0));
end data_selector;

architecture RTL of data_selector is

begin

	process (IN_A, IN_B, IN_SW, SEL_A, SEL_B) begin
		if(SEL_A = '0' and SEL_B = '0') then
			OUT_Y <= IN_A;
		elsif(SEL_A = '1'  and SEL_B = '0') then
			OUT_Y <= IN_B;
		elsif(SEL_A = '0' and SEL_B = '1') then
			OUT_Y <= IN_SW;
		else
			OUT_Y <= "0000";
		end if;	
	end process;

end RTL;

