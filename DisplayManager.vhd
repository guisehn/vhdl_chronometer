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

  with state select
    displays(0 to 3) <=
      "0111" when 0,
      "1011" when 1,
      "1101" when 2,
      "1110" when 3,
      "1111" when others;

  with state select
    bcd(3 downto 0) <=
      thousands when 0,
      hundreds when 1,
      tens when 2,
      ones when 3,
      "0000" when others;

  process (clock)
  begin
    if (clock'event and clock = '1') then
      if state = 3 then
        state <= 0;
      else
        state <= state + 1;
      end if;
    end if;
  end process;
end Behavioral;
