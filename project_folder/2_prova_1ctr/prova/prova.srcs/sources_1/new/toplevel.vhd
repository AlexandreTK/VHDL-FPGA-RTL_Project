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

entity toplevel is
    Port ( ontime : in  STD_LOGIC_VECTOR (7 downto 0);
       offtime : in  STD_LOGIC_VECTOR (7 downto 0);
       en : in  STD_LOGIC;
       CLK: in STD_LOGIC;
       led : out  STD_LOGIC);
end toplevel;

architecture Behavioral of toplevel is

	component fsm
    Port ( en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           A_lt_ontime : in STD_LOGIC;
           B_lt_offtime : in STD_LOGIC;
           ctr_clr : out  STD_LOGIC;
           ctr_cnt : out  STD_LOGIC;
           led : out  STD_LOGIC);
	end component;

	component operacional
    Port (    clk : in  STD_LOGIC;
              ontime : in  STD_LOGIC_VECTOR (7 downto 0);
              offtime : in  STD_LOGIC_VECTOR (7 downto 0);
              ctr_clr : in  STD_LOGIC;
              ctr_cnt : in  STD_LOGIC;
              A_lt_ontime : out STD_LOGIC;
              B_lt_offtime : out STD_LOGIC);
	end component;

	signal s1, s2, s3, s4: STD_LOGIC;
	
begin

	U1: fsm port map (	 	en => en,
                            clk => CLK,
                            A_lt_ontime => s1,
                            B_lt_offtime => s2,
                            ctr_clr => s3,
                            ctr_cnt => s4,
                            led => led
                            );

	U2: operacional port map (	clk => CLK,
                                ontime => ontime,
                                offtime => offtime,
                                ctr_clr => s3,
                                ctr_cnt => s4,
                                A_lt_ontime => s1,
                                B_lt_offtime => s2                    
                                );
                      

end Behavioral;
