----------------------------------------------------------------------------------
-- Aluno: Alexandre Torres Kryonidis
-- Matricula: 13/0099767
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           A_lt_B : out STD_LOGIC);
end cmp;

architecture Behavioral of cmp is

begin

    process(A)
    begin
        if ( to_integer(unsigned(A)) +1 < to_integer(unsigned(B)) ) then
            A_lt_B <= '1';
        else
            A_lt_B <= '0';
        end if;
    end process;

end Behavioral;
