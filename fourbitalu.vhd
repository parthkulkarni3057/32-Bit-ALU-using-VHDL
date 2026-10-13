
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbitalu is
port(A,B:in std_logic_vector(3 downto 0);
S:in std_logic_vector(2 downto 0);
Y:out std_logic_vector(3 downto 0);
Cin:in std_logic;
Cout : out std_logic);
end fourbitalu;

architecture structrual of fourbitalu is
signal add_result: std_logic_vector(3 downto 0);
signal sub_result: std_logic_vector(3 downto 0);
signal and_result: std_logic_vector(3 downto 0);
signal or_result: std_logic_vector(3 downto 0);
signal xor_result: std_logic_vector(3 downto 0);
signal add_cout:std_logic;
signal sub_cout:std_logic;
component fourbit is
port(A,B:in std_logic_vector(3 downto 0);
S:out std_logic_vector(3 downto 0);
Cin:in std_logic;
Cout:out std_logic);
end component;

component fourbitsub is
port(A,B:in std_logic_vector(3 downto 0);
S:out std_logic_vector(3 downto 0);
Cin:in std_logic;
Cout:out std_logic);
end component;

component fourbitAND is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end component;


component  fourbitOR is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end  component;


component fourbitXOR is
port(A,B:in std_logic_vector(3 downto 0);
Y:out std_logic_vector(3 downto 0));
end component;

component mux5 is
port(add_result:std_logic_vector(3 downto 0);
sub_result:std_logic_vector(3 downto 0);
and_result:std_logic_vector(3 downto 0);
or_result:std_logic_vector(3 downto 0);
xor_result:std_logic_vector(3 downto 0);
S:in std_logic_vector(2 downto 0);
Y:out std_logic_vector(3 downto 0)
);

end component;
begin
add1: fourbit port map(A=>A,B=>B,Cin=>Cin,S=>add_result,Cout=>add_cout);
sub1:fourbitsub port map(A=>A,B=>B,Cin=>Cin,S=>sub_result,Cout=>sub_cout);
and1:fourbitAND port map (A=>A,B=>B,Y=>and_result);
or1:fourbitOR port map (A=>A,B=>B,Y=>or_result);
xor1:fourbitXOR port map (A=>A,B=>B,Y=>xor_result);
mux:mux5 port map(add_result=>add_result,sub_result=>sub_result,or_result=>or_result,and_result=>and_result,
xor_result=>xor_result,S=>S,Y=>Y);
Cout<= add_cout when S="000" else
       sub_cout when S="001"else
       '0';
end structrual;
