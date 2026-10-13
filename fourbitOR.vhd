
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbitOR is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end fourbitOR;
architecture Behavioral of fourbitOR is

begin
Y<=A or B;

end Behavioral;
