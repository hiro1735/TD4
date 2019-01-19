--デコーダ
--入力：オペレーションコード(4bit)、キャリーフラグ(1bit)
--出力：Load信号(4bit)、セレクタ信号(2bit)
--ROMに格納された命令を実行

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decorder is
    Port ( OP_CODE : in  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : in  STD_LOGIC;
           LOAD : out  STD_LOGIC_VECTOR(3 downto 0);
           SEL_AB : out  STD_LOGIC_VECTOR(1 downto 0));
end decorder;

architecture RTL of decorder is

	signal selecter : STD_LOGIC_VECTOR(1 downto 0);

begin

	SEL_AB <= selecter;

	--OP_CODE(OP3,OP2,OP1,OP0) 
	--selecter(B,A) LOAD(LOAD3,LOAD2,LODAD1,LOAD0) 
	process (OP_CODE, C_FLAG) begin
		if (OP_CODE = "1110") then
			if (C_FLAG = '0') then
				--JNC(C=0)
				selecter <= "11"; LOAD <= "0111";
			elsif (C_FLAG = '1') then
				--JNC(C=1)
				selecter <= "11"; LOAD <= "1111";
			else
				selecter <= "11"; LOAD <= "1111";
			end if;
		else
			case OP_CODE is
				--ADD A,Im
				when "0000" => selecter <= "00"; LOAD <= "1110";
				--MOV A,B
				when "0001" => selecter <= "01"; LOAD <= "1110";
				--IN A
				when "0010" => selecter <= "10"; LOAD <= "1110";
				--MOV A,Im
				when "0011" => selecter <= "11"; LOAD <= "1110";
				--MOV B,A
				when "0100" => selecter <= "00"; LOAD <= "1101";
				--ADD B,Im
				when "0101" => selecter <= "01"; LOAD <= "1101";
				--IN B
				when "0110" => selecter <= "10"; LOAD <= "1101";
				--MOV B,Im
				when "0111" => selecter <= "11"; LOAD <= "1101";
				--OUT B
				when "1001" => selecter <= "01"; LOAD <= "1011";
				--OUT Im
				when "1011" => selecter <= "11"; LOAD <= "1011";
				--JMP
				when "1111" => selecter <= "11"; LOAD <= "0111";
				
				when others => selecter <= "11"; LOAD <= "1111";
			end case;
		end if;
	end process;

end RTL;

