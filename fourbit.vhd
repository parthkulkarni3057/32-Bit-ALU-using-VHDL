
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbit is
port(A,B:in std_logic_vector(3 downto 0);
S:out std_logic_vector(3 downto 0);
Cin:in std_logic;
Cout:out std_logic);
end fourbit;
architecture Behavioral of fourbit is
signal c: std_logic_vector(2 downto 0);
component fulladder is
port (A,B,Cin:in std_logic;
S,cout:out std_logic);
end component;
begin
FA0: fulladder port map(A=>A(0),B=>B(0),Cin=>Cin,S=>S(0),Cout=>c(0));
FA1: fulladder port map(A=>A(1),B=>B(1),Cin=>c(0),S=>S(1),Cout=>c(1));
FA2: fulladder port map(A=>A(2),B=>B(2),Cin=>c(1),S=>S(2),Cout=>c(2));
FA3: fulladder port map(A=>A(3),B=>B(3),Cin=>c(2),S=>S(3),Cout=>Cout);

end Behavioral;
