LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Registers IS
    PORT(
        RegWrite1,clock1,RESET1			:IN	STD_LOGIC;							-- Sinal do controlador de escrita
		Rs1, Rt1, Rd1					:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Endereço dos registradores a serem usados
		data							:IN STD_LOGIC_VECTOR(7 DOWNTO 0);		-- Valor a ser escrito
        RA1, RB1						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- Saída de informações dos registradores
END Registers;

ARCHITECTURE options OF Registers IS
	SIGNAL R0, R1, R2, R3, R4, R5, R6, R7	: STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
	BEGIN
	PROCESS (clock1, RegWrite1, Rs1, Rt1, Rd1, R0, R1, R2, R3, R4, R5, R6, R7, data, RESET1)
	BEGIN	
		IF RESET1 = '0' THEN
			R0 <= "00000000";
			R1 <= "00000000";
			R2 <= "00000000";
			R3 <= "00000000";
			R4 <= "00000000";
			R5 <= "00000000";
			R6 <= "00000000";
			R7 <= "00000000";
		END IF;
		IF clock1'EVENT AND clock1 = '1' AND RegWrite1 = '1' THEN -- Realiza a escrita antes da leitura na subida de clock 
			CASE Rd1 IS -- R0 é uma constante 0, por isso não há escrita neste registrador
				WHEN "001" =>
					R1 <= data;
				WHEN "010" =>
					R2 <= data;
				WHEN "011" =>
					R3 <= data;
				WHEN "100" =>
					R4 <= data;
				WHEN "101" =>
					R5 <= data;
				WHEN "110" =>
					R6 <= data;
				WHEN "111" =>
					R7 <= data;
				WHEN OTHERS => NULL;
			END CASE;
		ELSIF clock1'EVENT AND clock1 = '0' THEN -- Realiza a leitura dos registradores para executar a operação na ULA na descida do clock
			CASE Rs1 IS -- Leitura para RS
				WHEN "000" =>
					RA1 <= R0;
				WHEN "001" =>
					RA1 <= R1;
				WHEN "010" =>
					RA1 <= R2;
				WHEN "011" =>
					RA1 <= R3;
				WHEN "100" =>
					RA1 <= R4;
				WHEN "101" =>
					RA1 <= R5;
				WHEN "110" =>
					RA1 <= R6;
				WHEN "111" =>
					RA1 <= R7;
				WHEN OTHERS => NULL;
			END CASE;
			CASE Rt1 IS -- Leitura para RT
				WHEN "000" =>
					RB1 <= R0;
				WHEN "001" =>
					RB1 <= R1;
				WHEN "010" =>
					RB1 <= R2;
				WHEN "011" =>
					RB1 <= R3;
				WHEN "100" =>
					RB1 <= R4;
				WHEN "101" =>
					RB1 <= R5;
				WHEN "110" =>
					RB1 <= R6;
				WHEN "111" =>
					RB1 <= R7;
				WHEN OTHERS => NULL;
			END CASE;
		END IF; -- CLOCK
    END PROCESS;
END options;