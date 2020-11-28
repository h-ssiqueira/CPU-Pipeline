LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PC IS
	PORT( 	PCWrite1,CLOCK1		:IN STD_LOGIC; -- Sinal de escrita de PC e clock
			ADDRESS				:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor Atualizado de PC (PC+4)
			ADDR				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- Saída de PC
END PC;

ARCHITECTURE options OF PC IS
BEGIN

	SIGNAL value :BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); -- Valor de PC armazenado

	PROCESS(PCWrite1, ADDRESS,CLOCK1)
	BEGIN
		IF CLOCK'EVENT AND CLOCK1 = '1' THEN -- Leitura na subida de clock
			ADDR <= value;

		ELSIF CLOCK'EVENT AND CLOCK1 = '0' AND PCWrite = '1' THEN -- Atualização na descida de clock
			IF ADDRESS = "01000000" OR ADDRESS = "UUUUUUUU" THEN -- Caso passe do endereço 64, zera o valor de pc (pc mod 64), ou caso seja o primeiro ciclo da CPU
				value <= "00000000";
			ELSE -- Se não atingir o valor 64 ou não for o primeiro ciclo da CPU, atualiza o valor normalmente
				value <= ADDRESS;
			END IF;

		END IF;
	END PROCESS;
END options;

-- ***************** PC COM VARIÁVEL INTERNA 
-- ***************** SE NÃO FUNCIONAR USAR OS SINAIS DIRETAMENTE