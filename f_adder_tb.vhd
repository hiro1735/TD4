library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY f_adder_tb IS
END f_adder_tb;
 
ARCHITECTURE behavior OF f_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT f_adder
    PORT(
         IN_Y : IN STD_LOGIC_VECTOR(1 downto 0);
         IN_DATA : IN STD_LOGIC_VECTOR(1 downto 0);
         CIN : IN STD_LOGIC_VECTOR(1 downto 0);
         CRR : OUT STD_LOGIC_VECTOR(1 downto 0);
         DATA : OUT STD_LOGIC
        );
    END COMPONENT;

   --Inputs
   signal IN_Y : std_logic_vector(1 downto 0);
   signal IN_DATA : std_logic_vector(1 downto 0);
   signal CIN : std_logic_vector(1 downto 0);

 	--Outputs
   signal CRR : std_logic_vector(1 downto 0);
   signal DATA : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: f_adder PORT MAP (
          IN_Y => IN_Y,
          IN_DATA => IN_DATA,
          CIN => CIN,
          CRR => CRR,
          DATA => DATA
        );

   process
   begin		
		IN_Y <= "00";
		IN_DATA <= "00";
		CIN <= "00";
      wait for 100 ns;	
		IN_Y <= "01";
		wait for 100 ns;	
		IN_DATA <= "01";
		wait for 100 ns;	
		CIN <= "01";
		wait for 100 ns;	
		IN_DATA <= "00";
		wait for 100 ns;	
		IN_Y <= "00";
      wait;
   end process;

END;
