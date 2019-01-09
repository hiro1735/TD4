library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY register4_tb IS
END register4_tb;
 
ARCHITECTURE behavior OF register4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register4
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         LOAD : IN  std_logic_vector(3 downto 0);
         IN_DATA : IN  std_logic_vector(3 downto 0);
         OUT_A : OUT  std_logic_vector(3 downto 0);
         OUT_B : OUT  std_logic_vector(3 downto 0);
         OUT_LD : OUT  std_logic_vector(3 downto 0);
         ADDRESS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic;
   signal RST : std_logic := '0';
   signal LOAD : std_logic_vector(3 downto 0) := (others => '1');
   signal IN_DATA : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OUT_A : std_logic_vector(3 downto 0);
   signal OUT_B : std_logic_vector(3 downto 0);
   signal OUT_LD : std_logic_vector(3 downto 0);
   signal ADDRESS : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register4 PORT MAP (
          CLK => CLK,
          RST => RST,
          LOAD => LOAD,
          IN_DATA => IN_DATA,
          OUT_A => OUT_A,
          OUT_B => OUT_B,
          OUT_LD => OUT_LD,
          ADDRESS => ADDRESS
        );

   -- Clock process definitions
   process 
	begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	--LOADはローアクティブ
	process 
	begin
		IN_DATA <= "1010";
		wait for 7 ns;
		LOAD <= "1110";
		wait for 40 ns;
		LOAD <= "1101";
		wait for 20 ns;
		
		RST <= '1';
		wait for 10 ns;
		RST <= '0';
		
		IN_DATA <= "1100";
		wait for 40 ns;
		LOAD <= "1011";
		wait for 40 ns;
		LOAD <= "0111";
		
		wait;		
	end process;

END;
