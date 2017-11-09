LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DisplayClockDivider_TB IS
END DisplayClockDivider_TB;
 
ARCHITECTURE behavior OF DisplayClockDivider_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DisplayClockDivider
    PORT(
         clock : IN  std_logic;
         divided_clock : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';

 	--Outputs
   signal divided_clock : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DisplayClockDivider PORT MAP (
          clock => clock,
          divided_clock => divided_clock
        );

   -- Stimulus process
   stim_proc: process
   begin		
     clock <= '0';
	  wait for 5 ns;
     clock <= '1';
	  wait for 5 ns;
   end process;

END;
