--ALU
--入力：CLK,RST、データセレクタ(4bit)、ROM(4bit)
--出力：A,Bレジスタ、LED、プログラムカウンタ(4bit)　　繰り上がり時のキャリーフラグ(1bit)
--全加算器4bit分 + キャリーフラグ用FF

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           IN_Y : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM_DATA : in  STD_LOGIC_VECTOR(3 downto 0);
           OUT_DATA : out  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : out  STD_LOGIC);
end ALU;

architecture RTL of ALU is

	component f_adder
		 Port ( IN_Y : in STD_LOGIC_VECTOR(1 downto 0);
				  IN_DATA : in STD_LOGIC_VECTOR(1 downto 0);
				  CIN : in  STD_LOGIC_VECTOR(1 downto 0);
		        CRR : out STD_LOGIC_VECTOR(1 downto 0);
              DATA : out  STD_LOGIC);
	end component;
	
	component carry_flag
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CARRY : in  STD_LOGIC_VECTOR(1 downto 0);
           FLAG : out  STD_LOGIC);
	end component;
	
	signal in_y0 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_y1 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_y2 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_y3 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_data0 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_data1 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_data2 : STD_LOGIC_VECTOR(1 downto 0);
	signal in_data3 : STD_LOGIC_VECTOR(1 downto 0);
	signal crr0 : STD_LOGIC_VECTOR(1 downto 0);
	signal crr1 : STD_LOGIC_VECTOR(1 downto 0);
	signal crr2 : STD_LOGIC_VECTOR(1 downto 0);
	signal crr3 : STD_LOGIC_VECTOR(1 downto 0);
	signal data0 : std_logic;
	signal data1 : std_logic;
	signal data2 : std_logic;
	signal data3 : std_logic;

begin

	in_y0 <= '0' & IN_Y(0);
	in_y1 <= '0' & IN_Y(1);
	in_y2 <= '0' & IN_Y(2);
	in_y3 <= '0' & IN_Y(3);
	in_data0 <= '0' & ROM_DATA(0);
	in_data1 <= '0' & ROM_DATA(1);
	in_data2 <= '0' & ROM_DATA(2);
	in_data3 <= '0' & ROM_DATA(3);

	U20 : f_adder port map(in_y0, in_data0, "00", crr0, data0);
	U21 : f_adder port map(in_y1, in_data1, crr0, crr1, data1);
	U22 : f_adder port map(in_y2, in_data2, crr1, crr2, data2);
	U23 : f_adder port map(in_y3, in_data3, crr2, crr3, data3);
	U24 : carry_flag port map(clk, rst, crr3, c_flag);
	
	OUT_DATA <= data3 & data2 & data1 & data0;

end RTL;

