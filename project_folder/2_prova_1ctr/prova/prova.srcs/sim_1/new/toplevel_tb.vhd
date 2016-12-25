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

entity toplevel_tb is
--  Port ( );
end toplevel_tb;

architecture Behavior of toplevel_tb is

component toplevel is
    Port ( ontime : in  STD_LOGIC_VECTOR (7 downto 0);
       offtime : in  STD_LOGIC_VECTOR (7 downto 0);
       en : in  STD_LOGIC;
       CLK: in STD_LOGIC;
       led : out  STD_LOGIC);
end component;

   --Inputs
   signal en : std_logic := '0';
   signal CLK : std_logic := '0';
   signal ontime : std_logic_vector(7 downto 0) := "00000100";
   signal offtime : std_logic_vector(7 downto 0) := "00000011";

 	--Outputs
   signal led : std_logic;


   -- Clock period definitions
   constant CLK_period : time := 3.3 ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
   uut: toplevel PORT MAP (
          ontime => ontime,
          offtime => offtime,
          en => en,
          CLK => CLK,
          led => led
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
   

   -- Stimulus process
   stim_proc: process
   begin		
        en <= '0';
        wait for CLK_period*2;
        en <= '1';                -- Apertar botao por i periodo de clk
        wait for CLK_period*15;
        en <= '0';
        wait for CLK_period;
        en <= '1';
        wait for CLK_period*5;
        en <= '0';
        wait for CLK_period*5;
        en <= '1';
        wait;
   end process;


end;
