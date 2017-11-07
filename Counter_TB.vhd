--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:35:57 11/07/2017
-- Design Name:   
-- Module Name:   C:/projetos_ise/Chronometer_m70326/Counter_TB.vhd
-- Project Name:  Chronometer_m70326
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter
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
 
ENTITY Counter_TB IS
END Counter_TB;
 
ARCHITECTURE behavior OF Counter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         cnt : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal cnt : std_logic_vector(13 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          clk => clk,
          clr => clr,
          cnt => cnt
        );

   -- Stimulus process
   stim_proc: process
   begin		
     clk <= '0';
	  wait for 1 ns;
	  clk <= '1';
	  wait for 1 ns;
   end process;

END;
