LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Counter_TB IS
END Counter_TB;
 
ARCHITECTURE behavior OF Counter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         count : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal clear : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(13 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          clock => clock,
          clear => clear,
          count => count
        );

   -- Stimulus process
   stim_proc: process
   begin		
     clock <= '0';
	  wait for 1 ns;
	  clock <= '1';
	  wait for 1 ns;
   end process;

END;
