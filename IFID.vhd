LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IR IS
	PORT( 
            Memdata         					:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite, clock    		:IN STD_LOGIC;
         	inst15_12               		:OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	inst11_09,inst08_06	:OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	inst05_00             			:OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END IR;

    ARCHITECTURE options OF IR IS
	BEGIN
	PROCESS (IRWrite, clock)
    BEGIN
	IF clock'EVENT AND clock = '1' AND IRWrite = '1' THEN
		inst15_12 <= Memdata(15 DOWNTO 12); -- OPCODE
		inst11_09 <= Memdata(11 DOWNTO 9); -- RS
		inst08_06 <= Memdata(8 DOWNTO 6); -- RT
		inst05_00 <= Memdata(5 DOWNTO 0); -- COLETA O IMEDIATO
	END IF;
    END PROCESS;
	END options;
	