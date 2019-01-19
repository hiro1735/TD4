library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU2 is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           IN_Y : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM_DATA : in  STD_LOGIC_VECTOR(3 downto 0);
           OUT_DATA : out  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : out  STD_LOGIC);
end ALU2;

architecture RTL of ALU2 is

	signal data : std_logic_vector(4 downto 0);

begin

	--ç∂âEÇÃï”Ç5bitÇ…ëµÇ¶ÇÈ
	data <= ('0' & IN_Y) + ('0' & ROM_DATA);
	OUT_DATA <= data(3 downto 0);

	process (CLK, RST) begin
		if(RST = '1')then
			C_FLAG <= '0';
		elsif(rising_edge(CLK))then
			C_FLAG <= data(4);
		end if;
	end process;

end RTL;

