library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY decorder_tb IS
END decorder_tb;
 
ARCHITECTURE behavior OF decorder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decorder
    Port ( OP_CODE : in  STD_LOGIC_VECTOR(3 downto 0);
           C_FLAG : in  STD_LOGIC;
           LOAD : out  STD_LOGIC_VECTOR(3 downto 0);
           SEL_AB : out  STD_LOGIC_VECTOR(1 downto 0));
    END COMPONENT;
    

   --Inputs
   signal OP_CODE : std_logic_vector(3 downto 0) := (others => '0');
   signal C_FLAG : std_logic := '0';

 	--Outputs
   signal LOAD : std_logic_vector(3 downto 0);
   signal SEL_AB : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decorder PORT MAP (
          OP_CODE => OP_CODE,
          C_FLAG => C_FLAG,
          LOAD => LOAD,
          SEL_AB => SEL_AB
        );

   stim_proc: process
   begin		
      OP_CODE <= "1110";
		C_FLAG <= '0';
      wait for 100 ns;
		C_FLAG <= '1';
		wait for 100 ns;
		
		OP_CODE <= "0000";
		wait for 100 ns;
		
		for i in 0 to 15 loop
			OP_CODE <= OP_CODE + 1;
			wait for 100 ns;
		end loop;

      wait;
   end process;

END;
