LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DisplayManager_TB IS
END DisplayManager_TB;
 
ARCHITECTURE behavior OF DisplayManager_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DisplayManager
    PORT(
         clock : IN  std_logic;
         ones : IN  std_logic_vector(3 downto 0);
         tens : IN  std_logic_vector(3 downto 0);
         hundreds : IN  std_logic_vector(3 downto 0);
         thousands : IN  std_logic_vector(3 downto 0);
         segments : OUT  std_logic_vector(0 to 6);
         displays : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal ones : std_logic_vector(3 downto 0) := (others => '0');
   signal tens : std_logic_vector(3 downto 0) := (others => '0');
   signal hundreds : std_logic_vector(3 downto 0) := (others => '0');
   signal thousands : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal segments : std_logic_vector(0 to 6);
   signal displays : std_logic_vector(0 to 3);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DisplayManager PORT MAP (
          clock => clock,
          ones => ones,
          tens => tens,
          hundreds => hundreds,
          thousands => thousands,
          segments => segments,
          displays => displays
        );

   -- Stimulus process
   stim_proc: process
   begin		
    thousands <= "1001";
	  hundreds <= "1000";
	  tens <= "0111";
	  ones <= "0110";
	  
	  clock <= '0';
	  wait for 5 ns;
	  clock <= '1';
	  wait for 5 ns;
   end process;

END;
