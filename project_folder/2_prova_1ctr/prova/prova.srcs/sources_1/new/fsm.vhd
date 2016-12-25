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

entity fsm is
    Port ( en : in  STD_LOGIC;
       clk : in  STD_LOGIC;
       A_lt_ontime : in STD_LOGIC;
       B_lt_offtime : in STD_LOGIC;
       ctr_clr : out  STD_LOGIC;
       ctr_cnt : out  STD_LOGIC;
       led : out  STD_LOGIC);
end fsm;

architecture Behavioral of fsm is

	type estados is (S0, S1, S2);
	signal atual, proximo: estados := S0;

begin

	process(clk)
	begin
		if rising_edge(clk) then
		    atual <= proximo;
		end if;
	end process;
	
	process(atual, en, A_lt_ontime, B_lt_offtime)
    begin
        case atual is
            when S0 =>
                ctr_clr <= '1';
                ctr_cnt <= '0';
                led <= '0';
                if en = '1' then
                    proximo <= S1;
                else
                    proximo <= S0;
                end if;
            
            when S1 =>
                ctr_clr <= '0';
                ctr_cnt <= '1';
                led <= '1';
                if A_lt_ontime = '0' then
                    proximo <= S2;
                    ctr_clr <= '1';
                    ctr_cnt <= '0';
                else
                    proximo <= S1;
                end if;
                if en = '0' then
                    proximo <= S0;
                end if;
                      
            when S2 =>
                ctr_clr <= '0';
                ctr_cnt <= '1';
                led <= '0';
                if B_lt_offtime = '0' then
                    proximo <= S1;
                    ctr_clr <= '1';
                    ctr_cnt <= '0';
                else
                    proximo <= S2;
                end if;
                if en = '0' then
                    proximo <= S0;
                end if;
            
            end case;
        end process;

end Behavioral;
