library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClockDivider is
  Generic (N : integer := 2);
  Port (
    clock         : in std_logic;
    divided_clock : out std_logic
  );
end ClockDivider;

architecture Behavioral of ClockDivider is
  signal counter : integer range 0 to N := 0;
  signal internal_clock : std_logic := '0';
begin
  divided_clock <= internal_clock;

  process (clock)
  begin
    if (clock'event and clock = '1') then
      counter <= counter + 1;
      if counter = N then
        counter <= 0;
        internal_clock <= not internal_clock;
      end if;
    end if;
  end process;
end Behavioral;
