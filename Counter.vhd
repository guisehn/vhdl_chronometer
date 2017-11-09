library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
  Port (
    clock : in std_logic;
    clear : in std_logic;
    count : out std_logic_vector (13 downto 0)
  );
end Counter;

architecture Behavioral of Counter is
  constant INITIAL_VALUE : std_logic_vector (13 downto 0) := "00000000000000";
  constant FINAL_VALUE   : std_logic_vector (13 downto 0) := "10011100001111";
  signal value           : std_logic_vector (13 downto 0) := INITIAL_VALUE;
begin
  count <= value;

  process (clock, clear)
  begin
    if (clear = '1') then
      value <= INITIAL_VALUE;
	  elsif (clock'event and clock = '1') then
      if value = FINAL_VALUE then
        value <= INITIAL_VALUE;
      else
        value <= value + 1;
      end if;
    end if;
  end process;
end Behavioral;