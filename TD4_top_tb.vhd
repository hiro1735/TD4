library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY TD4_top_tb IS
END TD4_top_tb;
 
ARCHITECTURE behavior OF TD4_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TD4_top
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         CLK_SW : IN  std_logic;
         SL_SW : IN  std_logic_vector(3 downto 0);
         LED : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	
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

   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK_SW : std_logic := '0';
	signal clk_o : STD_LOGIC;
	signal address : STD_LOGIC_VECTOR(3 downto 0);
	signal rom_data : STD_LOGIC_VECTOR(3 downto 0);
	signal op_code : STD_LOGIC_VECTOR(3 downto 0);
	signal load : STD_LOGIC_VECTOR(3 downto 0);
	signal sel_ab : STD_LOGIC_VECTOR(1 downto 0);
	signal data_SelecterToAlu : STD_LOGIC_VECTOR(3 downto 0);
	signal data_AluToRegister : STD_LOGIC_VECTOR(3 downto 0);
	signal c_flag : STD_LOGIC;
	signal a_register : STD_LOGIC_VECTOR(3 downto 0);
	signal b_register : STD_LOGIC_VECTOR(3 downto 0);
   signal SL_SW : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal LED : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
   constant CLK_SW_period : time := 400 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TD4_top PORT MAP (
          CLK => CLK,
          RST => RST,
          CLK_SW => CLK_SW,
          SL_SW => SL_SW,
          LED => LED
        );
	
	U0 : register4 port map(clk_o, rst, load, data_AluToRegister, a_register, b_register, led, address);
	U1 : data_selector port map(a_register, b_register, sl_sw, sel_ab(0), sel_ab(1), data_SelecterToAlu);
	U2 : ALU2 port map(clk_o, rst, data_SelecterToAlu, rom_data, data_AluToRegister, c_flag);
	U3 : decorder port map(op_code, c_flag, load, sel_ab);
	U4 : rom_16byte port map(address, rom_data, op_code);
	U5 : key_chatter port map(clk, rst, clk_sw, clk_o);

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process; 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		CLK_SW <= '1';
      wait for CLK_SW_period/2;
		CLK_SW <= '0';
		wait for CLK_SW_period/2;
   end process;
	
	process
	begin
		wait for 100 ns;
		RST <= '1';
		wait for 200 ns;
		RST <= '0';
		wait;
	end process;

END;
