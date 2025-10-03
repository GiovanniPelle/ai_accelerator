library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paraMAC is
    generic (
        N : integer := 8
    )
    port (
        clk : in std_logic;
        rst : in std_logic;
        a   : in std_logic_vector(N-1 downto 0);
        b   : in std_logic_vector(N-1 downto 0);
        res : out std_logic_vector(31 downto 0)
        )

end entity;

architecture rtl of paraMAC is

    signal acc_reg : signed(31 downto 0) := (others => '0');

begin
    process(clk, rst)
    begin
        if rst = '1' then
            acc_reg <= (others => '0');
        elsif rising_edge(clk) then
            acc_reg <= acc_reg + (signed(a) * signed(b));
        end if;

    end_process;

    res <= std_logic_vector(acc_reg);

end architecture;
