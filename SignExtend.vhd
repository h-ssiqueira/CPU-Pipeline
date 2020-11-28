LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SignExtend IS
	PORT( 	Immediate		:IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			ExtImmediate	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SignExtend;

ARCHITECTURE options OF SignExtend IS
BEGIN
    PROCESS()
    BEGIN
        IF Immediate(5) = '1' THEN
            ExtImmediate(4 DOWNTO 0) <= Immediate(4 DOWNTO 0);
            ExtImmediate(7 DOWNTO 5) <= "100"; -- Retorna o imediato estendido com o valor de sinalalidade preservado (números negativos)
        ELSE
            ExtImmediate(5 DOWNTO 0) <= Immediate;
            ExtImmediate(7 DOWNTO 6) <= "00"; -- Retorna o imediato estendido com o valor de sinalidade preservado (números positivos)
        END IF;
    END PROCESS;
END options;