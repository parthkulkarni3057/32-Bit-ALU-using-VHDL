
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu32bit_tb is
end alu32bit_tb;

architecture Behavioral of alu32bit_tb is

    signal A    : std_logic_vector(31 downto 0);
    signal B    : std_logic_vector(31 downto 0);
    signal S    : std_logic_vector(2 downto 0);
    signal Y    : std_logic_vector(31 downto 0);
    signal Cout : std_logic;

begin

    UUT: entity work.alu32bit
        port map (
            A => A,
            B => B,
            S => S,
            Y => Y,
            Cout => Cout
        );

    process
    begin
        -- Addition
        A <= x"0000000F";
        B <= x"0000000A";
        S <= "000";
        wait for 10 ns;

        -- Subtraction
        S <= "001";
        wait for 10 ns;

        -- AND operation
        S <= "010";
        wait for 10 ns;

        -- OR operation
        S <= "011";
        wait for 10 ns;

        -- XOR operation
        S <= "100";
        wait for 10 ns;

        -- Left shift A by 1
        A <= x"00000005";
        B <= x"00000000";
        S <= "101";
        wait for 10 ns;

        -- Right shift A by 1
        S <= "110";
        wait for 10 ns;

        -- Pass A without changes
        S <= "111";
        wait for 10 ns;

        -- Test carry across 4-bit blocks
        A <= x"0000000F";
        B <= x"00000001";
        S <= "000";
        wait for 10 ns;

        -- Test 32-bit overflow
        A <= x"FFFFFFFF";
        B <= x"00000001";
        S <= "000";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
