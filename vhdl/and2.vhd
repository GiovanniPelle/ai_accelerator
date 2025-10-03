library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
    port (
        a : in  std_logic;
        b : in  std_logic;
        y : out std_logic
    );
end entity;

architecture rtl of and2 is
begin
    y <= a AND b;
end architecture;
