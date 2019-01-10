library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY key_chatter_tb IS
END key_chatter_tb;
 
ARCHITECTURE behavior OF key_chatter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_chatter
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         SW_I : IN  std_logic;
         SW_O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal SW_I : std_logic := '0';

 	--Outputs
   signal SW_O : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_chatter PORT MAP (
          CLK => CLK,
          RST => RST,
          SW_I => SW_I,
          SW_O => SW_O
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	process
	begin
		wait for 2ns;
		SW_I <= '1';
		wait for 15ns;
		SW_I <= '0';
		wait for 10ns;
		SW_I <= '1';
		wait for 30ns;
		SW_I <= '0';
		wait;
	end process;
END;
