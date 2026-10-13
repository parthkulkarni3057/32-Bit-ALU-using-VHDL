
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu32bit  is 
port(A,B:in std_logic_vector(31 downto 0);
S:in std_logic_vector(2 downto 0);
Y:out std_logic_vector(31 downto 0);
Cout : out std_logic);
end alu32bit ; 

architecture structural of alu32bit is

signal C:std_logic_vector(8 downto 0);
signal shift_left_result  : std_logic_vector(31 downto 0);
signal shift_right_result : std_logic_vector(31 downto 0);
signal alu_result : std_logic_vector(31 downto 0);

component fourbitalu is
port(A,B:in std_logic_vector(3 downto 0);
S:in std_logic_vector(2 downto 0);
Y:out std_logic_vector(3 downto 0);
Cin:in std_logic;
Cout : out std_logic);
end component;
begin

shift_left_result  <= A(30 downto 0) & '0';
shift_right_result <= '0' & A(31 downto 1);
  C(0) <= '0' when S = "000" else
            '1' when S = "001" else
            '0';
            
GEN_ALU: for i in 0 to 7 generate

ALU_INST: fourbitalu port map (A=>A(4*i+3 downto 4*i),
B=>B(4*i+3 downto 4*i),
S=>S,
Cin=>C(i),
Y=>alu_result(4*i+3 downto 4*i),
Cout=>C(i+1)
);
end generate GEN_ALU;
process(S, alu_result, shift_left_result, shift_right_result, A)
begin
    case S is
        when "000" => Y <= alu_result;          -- ADD
        when "001" => Y <= alu_result;          -- SUB
        when "010" => Y <= alu_result;          -- AND
        when "011" => Y <= alu_result;          -- OR
        when "100" => Y <= alu_result;          -- XOR
        when "101" => Y <= shift_left_result;   -- Left shift
        when "110" => Y <= shift_right_result;  -- Right shift
        when "111" => Y <= A;                   -- Pass A
        when others => Y <= (others => '0');
    end case;
end process;

Cout <= C(8) when S = "000" or S = "001" else '0';
end Structural;
