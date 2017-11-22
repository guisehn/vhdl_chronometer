--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:46:37 11/21/2017
-- Design Name:   
-- Module Name:   C:/Temp/Chronometer_m70326/ClockDivider_TB.vhd
-- Project Name:  Chronometer_m70326
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ClockDivider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ClockDivider_TB IS
END ClockDivider_TB;
 
ARCHITECTURE behavior OF ClockDivider_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ClockDivider
    PORT(
         clock : IN  std_logic;
         divided_clock : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';

 	--Outputs
   signal divided_clock : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ClockDivider PORT MAP (
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
