library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY data_selector_tb IS
END data_selector_tb;
 
ARCHITECTURE behavior OF data_selector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_selector
    Port ( IN_A : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_B : in  STD_LOGIC_VECTOR(3 downto 0);
           IN_SW : in  STD_LOGIC_VECTOR(3 downto 0);
           SEL_A : in  STD_LOGIC;
           SEL_B : in  STD_LOGIC;
           OUT_Y : out  STD_LOGIC_VECTOR(3 downto 0));
	END COMPONENT;
    
   --Inputs
   signal IN_A : STD_LOGIC_VECTOR(3 downto 0) := "1111";
   signal IN_B : STD_LOGIC_VECTOR(3 downto 0) := "0011";
   signal IN_SW : STD_LOGIC_VECTOR(3 downto 0) := "1100";
   signal SEL_A : STD_LOGIC:= '0';
   signal SEL_B : STD_LOGIC:= '0';

 	--Outputs
   signal OUT_Y : STD_LOGIC_VECTOR(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_selector PORT MAP (
          IN_A => IN_A,
          IN_B => IN_B,
          IN_SW => IN_SW,
          SEL_A => SEL_A,
          SEL_B => SEL_B,
          OUT_Y => OUT_Y
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		SEL_A <= '1';
		wait for 100 ns;
		SEL_A <= '0';
		SEL_B <= '1';
		wait for 100 ns;
		SEL_A <= '1';
      wait;
   end process;

END;
