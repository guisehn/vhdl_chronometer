library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DisplayManager is
  Port (
    clock      : in std_logic;
    ones       : in std_logic_vector (3 downto 0);
    tens       : in std_logic_vector (3 downto 0);
    hundreds   : in std_logic_vector (3 downto 0);
    thousands  : in std_logic_vector (3 downto 0);
    segments   : out std_logic_vector (0 to 6);
    displays   : out std_logic_vector (0 to 3)
  );
end DisplayManager;

architecture Behavioral of DisplayManager is
  signal state : integer range 0 to 3;
  signal bcd   : std_logic_vector (3 downto 0);
begin
  digit_display: entity work.Display
                 port map (bcd => bcd, segments => segments);

  process (clock)
  begin
    if (clock'event and clock = '1') then
      if (state = 0) then
        bcd <= thousands;
        state <= 1;
        displays <= "0111";
      elsif (state = 1) then
        bcd <= hundreds;
        state <= 2;
        displays <= "1011";
      elsif (state = 2) then
        bcd <= tens;
        state <= 3;
        displays <= "1101";
      elsif (state = 3) then
        bcd <= ones;
        state <= 0;
        displays <= "1110";
      end if;
    end if;
  end process;
end Behavioral;