
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbitAND is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end fourbitAND;
architecture Behavioral of fourbitAND is

begin
Y<=A and B;

end Behavioral;
