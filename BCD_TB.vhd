LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BCD_TB IS
END BCD_TB;
 
ARCHITECTURE behavior OF BCD_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD
    PORT(
         bits : IN  std_logic_vector(13 downto 0);
         ones : OUT  std_logic_vector(3 downto 0);
         tens : OUT  std_logic_vector(3 downto 0);
         hundreds : OUT  std_logic_vector(3 downto 0);
         thousands : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal bits : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal ones : std_logic_vector(3 downto 0);
   signal tens : std_logic_vector(3 downto 0);
   signal hundreds : std_logic_vector(3 downto 0);
   signal thousands : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD PORT MAP (
          bits => bits,
          ones => ones,
          tens => tens,
          hundreds => hundreds,
          thousands => thousands
        );
 
   -- Stimulus process
   stim_proc: process
   begin	
		-- 9876
      bits <= "10011010010100";
		wait for 5 ns;
		
		-- 320
		bits <= "00000101000000";
		wait for 5 ns;

		-- 741
		bits <= "00001011100101";
		wait for 5 ns;
		
		-- 3975
		bits <= "00111110000111";
		wait for 5 ns;

		-- 5559
		bits <= "01010110110111";
		wait for 5 ns;

		-- 2524
		bits <= "00100111011100";
		wait for 5 ns;

      wait;
   end process;

END;
