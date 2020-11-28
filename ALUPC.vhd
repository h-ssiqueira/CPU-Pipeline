LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALUPC IS
	PORT(   CLOCK1          :IN STD_LOGIC; -- Sinal de clock
			PC				:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor de PC da instruçâo atual
			PC4				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- Saída de PC atualizado (PC+4)
END ALUPC;

ARCHITECTURE options OF ALUPC IS
BEGIN
	PROCESS(CLOCK1)
	BEGIN
		IF CLOCK'EVENT AND CLOCK1 = '1' THEN -- Operaçâo na subida de clock (PC+4)
			PC4 <= PC + "00000100"
		END IF;
	END PROCESS;
END options;