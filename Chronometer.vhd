library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Chronometer is
  Port (
    clock           : in std_logic;
    clear_button    : in std_logic;
    start_button    : in std_logic;
    pause_button    : in std_logic;
    slowdown_button : in std_logic;
    segments        : out std_logic_vector (0 to 6);
    displays        : out std_logic_vector (0 to 3);
    seg_dp          : out std_logic
  );
end Chronometer;

architecture Behavioral of Chronometer is
  signal count                 : std_logic_vector (13 downto 0);
  signal bcd_ones              : std_logic_vector (3 downto 0);
  signal bcd_tens              : std_logic_vector (3 downto 0);
  signal bcd_hundreds          : std_logic_vector (3 downto 0);
  signal bcd_thousands         : std_logic_vector (3 downto 0);
  signal display_clock         : std_logic;
  signal default_counter_clock : std_logic;
  signal slow_counter_clock    : std_logic;
  signal counter_clock         : std_logic;
  signal managed_clock         : std_logic;
begin
  -- Turns off decimal point segment
  seg_dp <= '1';

  -- Clock that is only active if start button is on and pause button is off
  managed_clock <= start_button and (not pause_button) and clock;

  -- Default speed clock
  default_counter_clock_divider: entity work.ClockDivider
    generic map (25000)
    port map (clock => managed_clock, divided_clock => default_counter_clock);

  -- Slow speed clock
  slow_counter_clock_divider: entity work.ClockDivider
    generic map (2500000)
    port map (clock => managed_clock, divided_clock => slow_counter_clock);

  -- Sets whether the clock speed used is default or slow based on the slowdown_button
  counter_clock <= (slowdown_button and slow_counter_clock)
    or ((not slowdown_button) and default_counter_clock);

  -- Counter module using the clock defined above
  counter: entity work.Counter
    port map (clock => counter_clock, clear => clear_button, count => count);

  -- Transforms the counter bits to BCD (thousands, hundreds, tens and ones)
  bcd: entity work.BCD
    port map (bits => count, ones => bcd_ones, tens => bcd_tens,
      hundreds => bcd_hundreds, thousands => bcd_thousands);

  -- Display clock divider
  display_clock_divider: entity work.ClockDivider
    generic map (1000)
    port map (clock => clock, divided_clock => display_clock);

  -- Manages the display active at the time and the active segments
  display_manager: entity work.DisplayManager
    port map (clock => display_clock, ones => bcd_ones, tens => bcd_tens,
      hundreds => bcd_hundreds, thousands => bcd_thousands,
      segments => segments, displays => displays);
end Behavioral;