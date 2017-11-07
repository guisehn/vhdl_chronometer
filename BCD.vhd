library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Based on
-- https://en.wikipedia.org/wiki/Double_dabble

entity BCD is
  Port (
    bits      : in std_logic_vector (13 downto 0);
    ones      : out std_logic_vector (3 downto 0);
    tens      : out std_logic_vector (3 downto 0);
    hundreds  : out std_logic_vector (3 downto 0);
    thousands : out std_logic_vector (3 downto 0)
  );
end BCD;

architecture Behavioral of BCD is
begin
  process (bits)
    -- stores the original bits shifted left
    variable temp: std_logic_vector (13 downto 0);

    -- 16 bits to store the BCD
    -- thousands --> 15..12
    --  hundreds --> 11..8
    --      tens --> 7..4
    --     units --> 3..0
    variable bcd: unsigned (15 downto 0) := (others => '0');
  begin
    bcd := (others => '0'); -- resets bcd
    temp(13 downto 0) := bits; -- temp = bits

    for i in 0 to 13 loop
      if bcd(3 downto 0) >= 5 then
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;

      if bcd(7 downto 4) >= 5 then
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;

      if bcd(11 downto 8) >= 5 then
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;

      if bcd(15 downto 12) >= 5 then
        bcd(15 downto 12) := bcd(15 downto 12) + 3;
      end if;

      -- shift bcd left by 1 bit, copy MSB of temp into LSB of bcd
      bcd := bcd(14 downto 0) & temp(13);

      -- shift temp left by 1 bit
      temp := temp(12 downto 0) & '0';
    end loop;

    ones <= std_logic_vector(bcd(3 downto 0));
    tens <= std_logic_vector(bcd(7 downto 4));
    hundreds <= std_logic_vector(bcd(11 downto 8));
    thousands <= std_logic_vector(bcd(15 downto 12));
  end process;
end Behavioral;