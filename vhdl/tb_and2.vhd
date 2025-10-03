library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and2 is
end tb_and2;

architecture sim of tb_and2 is
    signal a, b, y : std_logic := '0';
begin
    uut: entity work.and2
        port map (a => a, b => b, y => y);

    process
    begin
        a <= '0'; b <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; wait for 10 ns;
        wait;
    end process;
end sim;
