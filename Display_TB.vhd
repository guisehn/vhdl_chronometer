LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Display_TB IS
END Display_TB;
 
ARCHITECTURE behavior OF Display_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Display
    PORT(
         bcd : IN  std_logic_vector(3 downto 0);
         segments : OUT  std_logic_vector(0 to 6)
        );
    END COMPONENT;
    

   --Inputs
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal segments : std_logic_vector(0 to 6);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Display PORT MAP (
          bcd => bcd,
          segments => segments
        );

   -- Stimulus process
   stim_proc: process
   begin		
      bcd <= "0000";
		wait for 5 ns;

		for i in 1 to 9 loop
			bcd <= bcd + 1;
			wait for 5 ns;
		end loop;

		bcd <= "0000";
      wait;
   end process;

END;
