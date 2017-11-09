library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Chronometer is
  Port (
    clock        : in std_logic;
    clear_button : in std_logic;
    start_button : in std_logic;
    pause_button : in std_logic;
    seg_a        : out std_logic;
    seg_b        : out std_logic;
    seg_c        : out std_logic;
    seg_d        : out std_logic;
    seg_e        : out std_logic;
    seg_f        : out std_logic;
    seg_g        : out std_logic;
    seg_dp       : out std_logic;
    display1     : out std_logic;
    display2     : out std_logic;
    display3     : out std_logic;
    display4     : out std_logic
  );
end Chronometer;

architecture Behavioral of Chronometer is
  signal count         : std_logic_vector (13 downto 0);
  signal bcd_ones      : std_logic_vector (3 downto 0);
  signal bcd_tens      : std_logic_vector (3 downto 0);
  signal bcd_hundreds  : std_logic_vector (3 downto 0);
  signal bcd_thousands : std_logic_vector (3 downto 0);
  signal segments      : std_logic_vector (0 to 6);
  signal displays      : std_logic_vector (0 to 3);
  signal display_clock : std_logic;
  signal counter_clock : std_logic;
  signal managed_clock : std_logic;
  signal on_off        : std_logic := '1';
begin
  seg_a <= segments(0);
  seg_b <= segments(1);
  seg_c <= segments(2);
  seg_d <= segments(3);
  seg_e <= segments(4);
  seg_f <= segments(5);
  seg_g <= segments(6);
  seg_dp <= '1';
  
  display1 <= displays(0);
  display2 <= displays(1);
  display3 <= displays(2);
  display4 <= displays(3);
  
  managed_clock <= on_off and clock;

  process (start_button, pause_button)
  begin
    if pause_button = '1' then
	   on_off <= '0';
	 elsif start_button = '1' then
	   on_off <= '1';
	 end if;
  end process;

  ccd: entity work.CounterClockDivider
       port map (clock => managed_clock, divided_clock => counter_clock);

  dcd: entity work.DisplayClockDivider
       port map (clock => clock, divided_clock => display_clock);

  cnt: entity work.Counter
       port map (clock => counter_clock, clear => clear_button, count => count);

  bcd: entity work.BCD
       port map (bits => count, ones => bcd_ones, tens => bcd_tens,
		           hundreds => bcd_hundreds, thousands => bcd_thousands);

  dmul: entity work.DisplayManager
        port map (clock => display_clock, ones => bcd_ones, tens => bcd_tens,
		            hundreds => bcd_hundreds, thousands => bcd_thousands,
						segments => segments, displays => displays);
end Behavioral;