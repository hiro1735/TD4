library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TD4_top is
	Port ( CLK : in  STD_LOGIC;
          RST : in  STD_LOGIC;
          CLK_SW : in  STD_LOGIC;
          SL_SW : in  STD_LOGIC_VECTOR(3 downto 0);
			 LED : out  STD_LOGIC_VECTOR(3 downto 0));
end TD4_top;

architecture RTL of TD4_top is

component register4
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LOAD : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_DATA : in  STD_LOGIC_VECTOR(3 downto 0);
           OUT_A : out  STD_LOGIC_VECTOR(3 downto 0);
           OUT_B : out  STD_LOGIC_VECTOR(3 downto 0);
           OUT_LD : out  STD_LOGIC_VECTOR(3 downto 0);
           ADDRESS : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component data_selector
    Port ( IN_A : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_B : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_SW : in  STD_LOGIC_VECTOR(3 downto 0);
           SEL_A : in  STD_LOGIC;
           SEL_B : in  STD_LOGIC;
           OUT_Y : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component ALU2
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           IN_Y : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM_DATA : in  STD_LOGIC_VECTOR(3 downto 0);
           OUT_DATA : out  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : out  STD_LOGIC);
end component;

component decorder
    Port ( OP_CODE : in  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : in  STD_LOGIC;
           LOAD : out  STD_LOGIC_VECTOR(3 downto 0);
           SEL_AB : out  STD_LOGIC_VECTOR(1 downto 0));
end component;

component rom_16byte 
    Port ( ADDRESS : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM_DATA : out  STD_LOGIC_VECTOR(3 downto 0);
			  OP_CODE : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component key_chatter
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SW_I : in  STD_LOGIC;
           SW_O : out  STD_LOGIC);
end component;

	signal clk_o : STD_LOGIC;
	signal load : STD_LOGIC_VECTOR(3 downto 0);
	signal data_AluToRegister : STD_LOGIC_VECTOR(3 downto 0);
	signal a_register : STD_LOGIC_VECTOR(3 downto 0);
	signal b_register : STD_LOGIC_VECTOR(3 downto 0);
	signal address : STD_LOGIC_VECTOR(3 downto 0);
	signal sel_ab : STD_LOGIC_VECTOR(1 downto 0);
	signal data_SelecterToAlu : STD_LOGIC_VECTOR(3 downto 0);
	signal rom_data : STD_LOGIC_VECTOR(3 downto 0);
	signal op_code : STD_LOGIC_VECTOR(3 downto 0);
	signal c_flag : STD_LOGIC;

begin

	U0 : register4 port map(clk_o, rst, load, data_AluToRegister, a_register, b_register, led, address);
	U1 : data_selector port map(a_register, b_register, sl_sw, sel_ab(0), sel_ab(1), data_SelecterToAlu);
	U2 : ALU2 port map(clk_o, rst, data_SelecterToAlu, rom_data, data_AluToRegister, c_flag);
	U3 : decorder port map(op_code, c_flag, load, sel_ab);
	U4 : rom_16byte port map(address, rom_data, op_code);
	U5 : key_chatter port map(clk, rst, clk_sw, clk_o);

end RTL;

