--レジスタA,B　LED出力　ROMへのアドレスパス
--入力：リセット、クロック、LOAD(レジスタ選択4bit)、IN_DATA(入力データ4bit)
--出力：OUT_A,B(レジスタ出力4bit)、OUT_LD(LED出力4bit)、ADDRESS(ROMへのアドレス4bit)
--LOADで値を転送するレジスタを選択、それ以外は値を保持

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register4 is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LOAD : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_DATA : in  STD_LOGIC_VECTOR(3 downto 0);
           OUT_A : out  STD_LOGIC_VECTOR(3 downto 0);
           OUT_B : out  STD_LOGIC_VECTOR(3 downto 0);
           OUT_LD : out  STD_LOGIC_VECTOR(3 downto 0);
           ADDRESS : out  STD_LOGIC_VECTOR(3 downto 0));
end register4;

architecture RTL of register4 is

	signal reg_a, reg_b, reg_c, reg_d : STD_LOGIC_VECTOR(3 downto 0);

begin

	OUT_A <= reg_a;
	OUT_B <= reg_b;
	OUT_LD <= reg_c;
	ADDRESS <= reg_d;

	process (CLK, RST) begin
		if(RST = '1')then
			reg_a <= (others => '0');
			reg_b <= (others => '0');
			reg_c <= (others => '0');
			reg_d <= (others => '0');
		elsif(rising_edge(CLK))then
			--プログラムカウンタ(reg_d)を+1する
			reg_d <= reg_d + 1;
			if(LOAD(0) = '0') then
				reg_a <= IN_DATA;
			elsif(LOAD(1) = '0') then
				reg_b <= IN_DATA;
			elsif(LOAD(2) = '0') then
				reg_c <= IN_DATA;
			elsif(LOAD(3) = '0') then
				reg_d <= IN_DATA;
			end if;
		end if;
	end process;

end RTL;

