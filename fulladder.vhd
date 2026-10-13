
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fulladder is
port (A,B,Cin:in std_logic;
S,cout:out std_logic);

end fulladder;

architecture Behavioral of fulladder is

begin
S<=A xor B xor Cin;
Cout<=((A and B)or (B and Cin)or(Cin and A));

end Behavioral;
