
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux5 is
port(add_result:std_logic_vector(3 downto 0);
sub_result:std_logic_vector(3 downto 0);
and_result:std_logic_vector(3 downto 0);
or_result:std_logic_vector(3 downto 0);
xor_result:std_logic_vector(3 downto 0);
S:in std_logic_vector(2 downto 0);
Y:out std_logic_vector(3 downto 0));
end mux5;
architecture behavioural of mux5 is
begin
process(S,add_result,sub_result,and_result,or_result,xor_result)
begin
case S is 
when "000"=>Y<=add_result;
when"001"=>Y<=sub_result;
when"010"=>Y<=and_result;
when"011"=>Y<=or_result;
when"100"=>Y<=xor_result;
when others =>Y<="0000";
end case;
end process;
end behavioural;
