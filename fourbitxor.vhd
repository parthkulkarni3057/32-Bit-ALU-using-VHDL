
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbitXOR is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end fourbitXOR;
architecture Behavioral of fourbitXOR is

begin
Y<=A xor B;

end Behavioral;
