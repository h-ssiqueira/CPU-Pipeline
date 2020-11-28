LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY REGSint IS
    PORT(
        RegWrite1,clock1,RESET1,RegDst						:IN	STD_LOGIC;							-- sinal do controlador de escrita
        MovtoReg1						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
        Rs1, Rt1					:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
        ExtImmediate1,ALUout1					:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
        R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
        RA1, RB1						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
END REGSint;

ARCHITECTURE options OF REGSint IS
	SIGNAL AUXa : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
	PROCESS (clock1,RegWrite1, RegDst, Rs1,Rt1, ExtImmediate1,ALUout1,MovtoReg1, R0, R1, R2, R3, R4, R5, R6, R7,AUXa,RESET1)
	BEGIN	
		IF clock1'EVENT AND clock1 = '1' THEN
		--IF clock1 = '1' THEN
			IF RESET1 = '0' THEN
					R0 <= "00000000";
					R1 <= "00000000";
					R2 <= "00000000";
					R3 <= "00000000";
					R4 <= "00000000";
					R5 <= "00000000";
					R6 <= "00000000";
					R7 <= "00000000";
			ELSIF RegWrite1 = '0' THEN -- Sem escrita
				CASE Rs1 IS
				
					WHEN "000" =>
						RA1 <= R0; -- Lê de R0 para a saída A
						AUXa <= R0;
						
					WHEN "001" =>
						RA1 <= R1; -- Lê de R1 para a saída A
						AUXa <= R1;
						
					WHEN "010" =>
						RA1 <= R2; -- Lê de R2 para a saída A
						AUXa <= R2;
						
					WHEN "011" =>
						RA1 <= R3; -- Lê de R3 para a saída A
						AUXa <= R3;
						
					WHEN "100" =>
						RA1 <= R4; -- Lê de R4 para a saída A
						AUXa <= R4;
						
					WHEN "101" =>
						RA1 <= R5; -- Lê de R5 para a saída A
						AUXa <= R5;
						
					WHEN "110" =>
						RA1 <= R6; -- Lê de R6 para a saída A
						AUXa <= R6;
						
					WHEN "111" =>
						RA1 <= R7; -- Lê de R7 para a saída A
						AUXa <= R7;

					WHEN OTHERS => NULL;
					
				END CASE;
				
				CASE Rt1 IS
				
					WHEN "000" =>
						RB1 <= R0; -- Lê de R0 para a saída B
						
					WHEN "001" =>
						RB1 <= R1; -- Lê de R1 para a saída B
						
					WHEN "010" =>
						RB1 <= R2; -- Lê de R2 para a saída B
						
					WHEN "011" =>
						RB1 <= R3; -- Lê de R3 para a saída B

					WHEN "100" =>
						RB1 <= R4; -- Lê de R4 para a saída B
						
					WHEN "101" =>
						RB1<= R5; -- Lê de R5 para a saída B
						
					WHEN "110" =>
						RB1 <= R6; -- Lê de R6 para a saída B
						
					WHEN "111" =>
						RB1 <= R7; -- Lê de R7 para a saída B
						
					WHEN OTHERS => NULL;
					
				END CASE;
			ELSIF RegWrite1 = '1' THEN -- Com escrita 
			IF RegDst = '0' THEN -- TIPO I
				CASE Rt1 IS 
				
               WHEN "000" =>
                        CASE MovtoReg1 IS
                            WHEN "00" =>
                                R0 <= ALUout1;
                            WHEN "01" =>
                                R0 <= ExtImmediate1; -- Escreve em R0
                            WHEN "10" =>
                                R0 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;

					WHEN "001" =>
                        CASE MovtoReg1 IS
                            WHEN "00" =>
                                R1 <= ALUout1;
                            WHEN "01" =>
                                R1 <= ExtImmediate1; -- Escreve em R1
                            WHEN "10" =>
                                R1 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "010" =>
						CASE MovtoReg1 IS
                            WHEN "00" =>
                                R2 <= ALUout1;
                            WHEN "01" =>
                                R2 <= ExtImmediate1; -- Escreve em R2
                            WHEN "10" =>
                                R2 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "011" =>
						CASE MovtoReg1 IS
                            WHEN "00" =>
                                R3 <= ALUout1;
                            WHEN "01" =>
                                R3 <= ExtImmediate1; -- Escreve em R3
                            WHEN "10" =>
                                R3 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "100" =>
						CASE MovtoReg1 IS
                            WHEN "00" =>
                                R4 <= ALUout1;
                            WHEN "01" =>
                                R4 <= ExtImmediate1; -- Escreve em R4
                            WHEN "10" =>
                                R4 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "101" =>
						CASE MovtoReg1 IS
                            WHEN "00" =>
                                R5 <= ALUout1;
                            WHEN "01" =>
                                R5 <= ExtImmediate1; -- Escreve em R5
                            WHEN "10" =>
                                R5 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "110" =>
                        CASE MovtoReg1 IS
                            WHEN "00" =>
                                R6 <= ALUout1;
                            WHEN "01" =>
                                R6 <= ExtImmediate1; -- Escreve em R6
                            WHEN "10" =>
                                R6 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;
						
					WHEN "111" =>
                        CASE MovtoReg1 IS
                            WHEN "00" =>
                                R7 <= ALUout1;
                            WHEN "01" =>
                                R7 <= ExtImmediate1; -- Escreve em R7
                            WHEN "10" =>
                                R7 <= AUXa;
                            WHEN OTHERS => NULL;
                        END CASE;

					WHEN OTHERS => NULL;
					
				END CASE;
			ELSIF RegDst = '1' THEN -- INSTRUÇÃO TIPO R
				CASE ExtImmediate1(5 DOWNTO 3) IS -- RD SE SITUA NO IMEDIATO 000 000 => 00 000 000
						WHEN "000" =>
									CASE MovtoReg1 IS
										 WHEN "00" =>
											  R0 <= ALUout1;
										 WHEN "01" =>
											  R0 <= ExtImmediate1; -- Escreve em R0
										 WHEN "10" =>
											  R0 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;

						WHEN "001" =>
									CASE MovtoReg1 IS
										 WHEN "00" =>
											  R1 <= ALUout1;
										 WHEN "01" =>
											  R1 <= ExtImmediate1; -- Escreve em R1
										 WHEN "10" =>
											  R1 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "010" =>
							CASE MovtoReg1 IS
										 WHEN "00" =>
											  R2 <= ALUout1;
										 WHEN "01" =>
											  R2 <= ExtImmediate1; -- Escreve em R2
										 WHEN "10" =>
											  R2 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "011" =>
							CASE MovtoReg1 IS
										 WHEN "00" =>
											  R3 <= ALUout1;
										 WHEN "01" =>
											  R3 <= ExtImmediate1; -- Escreve em R3
										 WHEN "10" =>
											  R3 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "100" =>
							CASE MovtoReg1 IS
										 WHEN "00" =>
											  R4 <= ALUout1;
										 WHEN "01" =>
											  R4 <= ExtImmediate1; -- Escreve em R4
										 WHEN "10" =>
											  R4 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "101" =>
							CASE MovtoReg1 IS
										 WHEN "00" =>
											  R5 <= ALUout1;
										 WHEN "01" =>
											  R5 <= ExtImmediate1; -- Escreve em R5
										 WHEN "10" =>
											  R5 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "110" =>
									CASE MovtoReg1 IS
										 WHEN "00" =>
											  R6 <= ALUout1;
										 WHEN "01" =>
											  R6 <= ExtImmediate1; -- Escreve em R6
										 WHEN "10" =>
											  R6 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;
							
						WHEN "111" =>
									CASE MovtoReg1 IS
										 WHEN "00" =>
											  R7 <= ALUout1;
										 WHEN "01" =>
											  R7 <= ExtImmediate1; -- Escreve em R7
										 WHEN "10" =>
											  R7 <= AUXa;
										 WHEN OTHERS => NULL;
									END CASE;

						WHEN OTHERS => NULL;
						
					END CASE;
				END IF; -- REGDST
		  END IF; -- REGWRITE
		 END IF; -- CLOCK
    END PROCESS;
END options;