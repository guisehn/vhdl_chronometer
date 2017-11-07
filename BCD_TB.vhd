--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:59:46 11/07/2017
-- Design Name:   
-- Module Name:   C:/projetos_ise/Chronometer_m70326/BCD_TB.vhd
-- Project Name:  Chronometer_m70326
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD
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
      bits <= "10011010010100";
		wait for 5 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
