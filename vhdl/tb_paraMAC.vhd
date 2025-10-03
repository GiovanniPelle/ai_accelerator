library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity tb_paraMAC is
end entity;

architecture sim of tb_paraMAC is

    constant N : integer := 8;

    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal a   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal b   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal res : std_logic_vector(31 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- 1) Clock
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process clk_process;

    -- 2) DUT
    uut : entity work.paraMAC
        generic map ( N => N )
        port map (
            clk => clk,
            rst => rst,
            a   => a,
            b   => b,
            res => res
        );

    -- 3) Stimulus
    stim_proc : process
    begin
        -- Reset
        rst <= '1';
        wait for 3*clk_period;
        rst <= '0';

        -- First test
        a <= std_logic_vector(to_unsigned(2, N));
        b <= std_logic_vector(to_unsigned(3, N));
        wait for 5*clk_period;

        -- Second test
        a <= std_logic_vector(to_unsigned(4, N));
        b <= std_logic_vector(to_unsigned(5, N));
        wait for 5*clk_period;

        -- Third test
        a <= std_logic_vector(to_unsigned(7, N));
        b <= std_logic_vector(to_unsigned(1, N));
        wait for 5*clk_period;

        -- Stop
        wait;
    end process stim_proc;

end architecture sim;
