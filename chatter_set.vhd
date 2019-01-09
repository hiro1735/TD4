library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity chatter_set is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK_SW_IN : in  STD_LOGIC;
           SW1_IN : in  STD_LOGIC;
           SW2_IN : in  STD_LOGIC;
           SW3_IN : in  STD_LOGIC;
           SW4_IN : in  STD_LOGIC;
           CLK_SW_OUT : out  STD_LOGIC;
           SW1_OUT : out  STD_LOGIC;
           SW2_OUT : out  STD_LOGIC;
           SW3_OUT : out  STD_LOGIC;
           SW4_OUT : out  STD_LOGIC);
end chatter_set;

architecture RTL of chatter_set is

	component key_chatter
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SW_I : in  STD_LOGIC;
           SW_O : out  STD_LOGIC);
	end component;

begin

	--U50 : key_chatter port map(clk, rst, CLK_SW_IN, CLK_SW_OUT);

end RTL;

