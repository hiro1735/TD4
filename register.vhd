--���W�X�^A,B�@LED�o�́@ROM�ւ̃A�h���X�p�X
--���́F���Z�b�g�A�N���b�N�ALOAD(���W�X�^�I��4bit)�AIN_DATA(���̓f�[�^4bit)
--�o�́FOUT_A,B(���W�X�^�o��4bit)�AOUT_LD(LED�o��4bit)�AADDRESS(ROM�ւ̃A�h���X4bit)
--LOAD�Œl��]�����郌�W�X�^��I���A����ȊO�͒l��ێ�

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
			--�v���O�����J�E���^(reg_d)��+1����
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

