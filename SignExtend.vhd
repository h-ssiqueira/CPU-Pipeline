LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SignExtend IS
	PORT( 	Immediate		:IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			ExtImmediate	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SignExtend;

ARCHITECTURE options OF SignExtend IS
BEGIN
    ExtImmediate(5 DOWNTO 0) <= Immediate;
    ExtImmediate(7 DOWNTO 6) <= "00"; -- retorna o imediato estendido
END options;