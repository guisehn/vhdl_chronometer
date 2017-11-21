library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CounterClockDivider is
  Port (
    clock         : in std_logic;
    divided_clock : out std_logic
  );
end CounterClockDivider;

architecture Behavioral of CounterClockDivider is
  signal counter : integer range 0 to 25000 := 1;
  signal internal_clock : std_logic := '0';
begin
  divided_clock <= internal_clock;

  process (clock)
  begin
    if (clock'event and clock = '1') then
      counter <= counter + 1;
      if counter = 25000 then
        counter <= 0;
        internal_clock <= not internal_clock;
      end if;
    end if;
  end process;
end Behavioral;
