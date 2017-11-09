library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Display is
  Port (
    bcd      : in std_logic_vector (3 downto 0);
	 segments : out std_logic_vector (0 to 6)
  );
end Display;

architecture Behavioral of Display is
begin
  -- A
  segments(0) <=
    (bcd(0) and (not bcd(1)) and (not bcd(2)) and (not bcd(3)))
    or ((not bcd(0)) and (not bcd(1)) and bcd(2) and (not bcd(3)));

  -- B
  segments(1) <= bcd(2) and (bcd(0) xor bcd(1));

  -- C
  segments(2) <= ((not bcd(0)) and bcd(1) and (not bcd(2)) and (not bcd(3)));

  -- D
  segments(3) <= (not bcd(3)) and (
    (bcd(0) and (not bcd(1)) and (not bcd(2)))
	 or ((not bcd(0)) and (not bcd(1)) and bcd(2))
	 or (bcd(0) and bcd(1) and bcd(2))
  );

  -- E
  segments(4) <= bcd(0) or (bcd(2) and (not bcd(1)));

  -- F
  segments(5) <=
    (bcd(1) and (not bcd(2)))
	 or (bcd(0) and bcd(1))
	 or (bcd(0) and (not bcd(2)) and (not bcd(3)));

  -- G
  segments(6) <=
    ((not bcd(1)) and (not bcd(2)) and (not bcd(3)))
	 or (bcd(0) and bcd(1) and bcd(2));
end Behavioral;