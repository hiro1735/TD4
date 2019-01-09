library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY rom_16byte_tb IS
END rom_16byte_tb;
 
ARCHITECTURE behavior OF rom_16byte_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom_16byte
    PORT ( ADDRESS : in  STD_LOGIC_VECTOR(3 downto 0);
           ROM_DATA : out  STD_LOGIC_VECTOR(3 downto 0);
			  OP_CODE : out  STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal ADDRESS : std_logic_vector(3 downto 0);

 	--Outputs
   signal ROM_DATA : std_logic_vector(3 downto 0);
	signal OP_CODE : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom_16byte PORT MAP (
          ADDRESS => ADDRESS,
          ROM_DATA => ROM_DATA,
			 OP_CODE => OP_CODE
        );

   -- Clock process definitions
   process begin
		Address <= "0000";
		wait for 100 ns;
		Address <= "0001";
		wait for 100 ns;
		Address <= "0010";
		wait for 100 ns;
		Address <= "0011";
		wait for 100 ns;
		Address <= "0100";
		wait for 100 ns;
		Address <= "0101";
		wait for 100 ns;
		Address <= "0110";
		wait for 100 ns;
		Address <= "0111";
		wait for 100 ns;
		Address <= "1000";
		wait for 100 ns;
		Address <= "1001";
		wait for 100 ns;
		Address <= "1010";
		wait for 100 ns;
		Address <= "1011";
		wait for 100 ns;
		Address <= "1100";
		wait for 100 ns;
		Address <= "1101";
		wait for 100 ns;
		Address <= "1110";
		wait for 100 ns;
		Address <= "1111";
		wait for 100 ns;
		
		wait;
		
   end process;

END;
