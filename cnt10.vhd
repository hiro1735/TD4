--�S���Z��iALU�̈ꕔ�j
--���́F�f�[�^�Z���N�^(4bit)�AROM(4bit)�A�L�����[(1bit)
--�o�́F�f�[�^(1bit)�@�@�J��オ�莞�̃L�����[�t���O(1bit)
--ALU�ɓ��͂��ꂽ�e����bit���Ƃ�IN_Y,IN_DATA,CIN�����Z

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity f_adder is
    Port ( IN_Y : in STD_LOGIC_VECTOR(1 downto 0);
			  IN_DATA : in STD_LOGIC_VECTOR(1 downto 0);
			  CIN : in  STD_LOGIC_VECTOR(1 downto 0);
		     CRR : out STD_LOGIC_VECTOR(1 downto 0);
           DATA : out  STD_LOGIC);
end f_adder;

architecture RTL of f_adder is
	signal q : std_logic_vector(1 downto 0);
begin

	process (q, IN_Y, IN_DATA, CIN) begin
		
		q <= IN_Y + IN_DATA + CIN;

		if(q = 3)then
			DATA <= '1';
			CRR <= "01";
		elsif(q = 2) then
			DATA <= '0';
			CRR <= "01";
		elsif(q = 1) then
			DATA <= '1';
			CRR <= "00";
		else
			DATA <= '0';
			CRR <= "00";
		end if;
	end process;

end RTL;

