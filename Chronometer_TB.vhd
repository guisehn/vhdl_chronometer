LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Chronometer_TB IS
END Chronometer_TB;
 
ARCHITECTURE behavior OF Chronometer_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Chronometer
    PORT(
         clock : IN  std_logic;
         clear_button : IN  std_logic;
         start_button : IN  std_logic;
         pause_button : IN  std_logic;
         seg_a : OUT  std_logic;
         seg_b : OUT  std_logic;
         seg_c : OUT  std_logic;
         seg_d : OUT  std_logic;
         seg_e : OUT  std_logic;
         seg_f : OUT  std_logic;
         seg_g : OUT  std_logic;
         seg_dp : OUT  std_logic;
         display1 : OUT  std_logic;
         display2 : OUT  std_logic;
         display3 : OUT  std_logic;
         display4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal clear_button : std_logic := '0';
   signal start_button : std_logic := '0';
   signal pause_button : std_logic := '0';

 	--Outputs
   signal seg_a : std_logic;
   signal seg_b : std_logic;
   signal seg_c : std_logic;
   signal seg_d : std_logic;
   signal seg_e : std_logic;
   signal seg_f : std_logic;
   signal seg_g : std_logic;
   signal seg_dp : std_logic;
   signal display1 : std_logic;
   signal display2 : std_logic;
   signal display3 : std_logic;
   signal display4 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Chronometer PORT MAP (
          clock => clock,
          clear_button => clear_button,
          start_button => start_button,
          pause_button => pause_button,
          seg_a => seg_a,
          seg_b => seg_b,
          seg_c => seg_c,
          seg_d => seg_d,
          seg_e => seg_e,
          seg_f => seg_f,
          seg_g => seg_g,
          seg_dp => seg_dp,
          display1 => display1,
          display2 => display2,
          display3 => display3,
          display4 => display4
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
