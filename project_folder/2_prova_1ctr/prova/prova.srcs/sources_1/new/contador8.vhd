----------------------------------------------------------------------------------
-- Aluno: Alexandre Torres Kryonidis
-- Matricula: 13/0099767
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador8 is
    Port ( clear : in  STD_LOGIC;
       count : in  STD_LOGIC;
       clk: in STD_LOGIC;
       Q : out  STD_LOGIC_VECTOR (7 downto 0));
end contador8;

architecture Behavioral of contador8 is

	signal sQ: integer range 0 to 7;
	
begin

	process(clk, clear)
	begin
		if rising_edge(clk) then
			if clear = '1' then
				sQ <= 0;
			elsif count = '1' then
				sQ <= sQ + 1;
			else
				sQ <= sQ;
			end if;
		end if;
	end process;
	
	Q <= STD_LOGIC_VECTOR(to_unsigned(sQ,8));
	

end Behavioral;
