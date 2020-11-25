LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( ALUSrcA,clock		:IN	STD_LOGIC;
			ALUop,ALUSrcB	:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A, B,PC,Imed	:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ULA;

	ARCHITECTURE options OF ULA IS
	--SIGNAL Result : STD_LOGIC_VECTOR(8 DOWNTO 0);
	--SIGNAL RB, RA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
	PROCESS (ALUop, A, B, ALUSrcA,ALUSrcB,clock, PC,Imed)
	BEGIN
	
		--IF clock'EVENT AND clock = '1' THEN ---- Atribuição dos operandos a variáveis internas para realizar operação (inutilizado)
			--CASE ALUSrcB  IS
				--WHEN "00" => --carrega direto o valor de B
					--RB <= B;
				--WHEN "01" => --caregga o valo '4'
					--RB <= "00000100";
				--WHEN "10" => -- carrega o imediato
					--RB <= Imed;
				--WHEN OTHERS => NULL;
			--END CASE;

			--CASE ALUSrcA IS
				--WHEN '0' => --coleta o valor de PC
					--RA <= PC;
				--WHEN '1' => --coleta o valor de A
					--RA <= A;
				--WHEN OTHERS => NULL;
				--END CASE;
				
		IF clock'EVENT AND clock = '0' THEN
		--IF clock = '0' THEN
			CASE ALUop IS
				WHEN "00" => -- AND

					CASE ALUSrcB  IS
						WHEN "00" => --carrega direto o valor de B
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC AND B;
								WHEN '1' => --coleta o valor de A
									ALUout <= A AND B;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "01" => --carrega o valor '4'
						CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC AND "00000100";
								WHEN '1' => --coleta o valor de A
									ALUout <= A AND "00000100";
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "10" => -- carrega o imediato
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC AND Imed;
								WHEN '1' => --coleta o valor de A
									ALUout <= A AND Imed;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN OTHERS => NULL;
					END CASE;
				
					--ALUout <= RA AND RB;

				WHEN "01" => -- OR
				
					CASE ALUSrcB  IS
						WHEN "00" => --carrega direto o valor de B
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC OR B;
								WHEN '1' => --coleta o valor de A
									ALUout <= A OR B;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "01" => --carrega o valor '4'
						CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC OR "00000100";
								WHEN '1' => --coleta o valor de A
									ALUout <= A OR "00000100";
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "10" => -- carrega o imediato
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC OR Imed;
								WHEN '1' => --coleta o valor de A
									ALUout <= A OR Imed;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN OTHERS => NULL;
					END CASE;
				
					--ALUout <= RA OR RB; 
					
				WHEN "10" => -- ADD
					
					CASE ALUSrcB  IS
						WHEN "00" => --carrega direto o valor de B
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC + B;
								WHEN '1' => --coleta o valor de A
									ALUout <= A + B;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "01" => --carrega o valor '4'
						CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC + "00000100";
								WHEN '1' => --coleta o valor de A
									ALUout <= A + "00000100";
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "10" => -- carrega o imediato
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC + Imed;
								WHEN '1' => --coleta o valor de A
									ALUout <= A + Imed;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN OTHERS => NULL;
					END CASE;
					
					--Result <= ('0'& RA) + RB ;	 	--- Realiza a soma e guarda em uma variável auxiliar de 1 bit adicional
					
					--ALUout <= Result(7 DOWNTO 0);	-- Guarda a soma no output
					
					--ALUout <= RA + RB;
					
				WHEN "11" => -- SUB
					
					CASE ALUSrcB  IS
						WHEN "00" => --carrega direto o valor de B
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC - B;
								WHEN '1' => --coleta o valor de A
									ALUout <= A - B;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "01" => --carrega o valor '4'
						CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC - "00000100";
								WHEN '1' => --coleta o valor de A
									ALUout <= A - "00000100";
								WHEN OTHERS => NULL;
							END CASE;
						WHEN "10" => -- carrega o imediato
							CASE ALUSrcA IS
								WHEN '0' => --coleta o valor de PC
									ALUout <= PC - Imed;
								WHEN '1' => --coleta o valor de A
									ALUout <= A - Imed;
								WHEN OTHERS => NULL;
							END CASE;
						WHEN OTHERS => NULL;
					END CASE;
					
					--ALUout <= RA - RB;
					
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
	END options;