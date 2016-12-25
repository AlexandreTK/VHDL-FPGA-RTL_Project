----------------------------------------------------------------------------------
-- Aluno: Alexandre Torres Kryonidis
-- Matricula: 13/0099767
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operacional is
    Port (    clk : in  STD_LOGIC;
              ontime : in  STD_LOGIC_VECTOR (7 downto 0);
              offtime : in  STD_LOGIC_VECTOR (7 downto 0);
              ctr_clr : in  STD_LOGIC;
              ctr_cnt : in  STD_LOGIC;
              A_lt_ontime : out STD_LOGIC;
              B_lt_offtime : out STD_LOGIC);
end operacional;

architecture Behavioral of operacional is

	component contador8
    Port ( clear : in  STD_LOGIC;
           count : in  STD_LOGIC;
		   clk: in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component cmp
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           A_lt_B : out STD_LOGIC);
    end component;

--	signal a_cont_to_reg, a_reg_to_comp, b_cont_to_reg, b_reg_to_comp: STD_LOGIC_VECTOR (7 downto 0);
signal ctr_to_cmp: STD_LOGIC_VECTOR (7 downto 0);
begin

	U1: contador8 port map (  clear => ctr_clr,
							   count => ctr_cnt,
							   clk => clk,
							   Q => ctr_to_cmp);

	U2: cmp port map (	A => ctr_to_cmp,
						B => ontime,
						A_lt_B => A_lt_ontime);

	U3: cmp port map (	A => ctr_to_cmp,
						B => offtime,
						A_lt_B => B_lt_offtime);

end Behavioral;
