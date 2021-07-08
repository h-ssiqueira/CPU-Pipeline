LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Control IS
    PORT(   clock1, reset1                                      :IN STD_LOGIC;
            opcode                                              :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PCWrite1, ALUSrcB1, REGWrite1, RegDst1    			:OUT STD_LOGIC;
            ALUOp1                         						:OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    	);
            
END Control;

ARCHITECTURE options OF Control IS
--TYPE STATE_TYPE IS (OpAddI, OpAddR, OpSubR, OpSubI, OpAndR, OpAndI, OpOrR, OpOrI);
--SIGNAL state: STATE_TYPE;
BEGIN
	PROCESS (clock1, reset1, opcode)
    BEGIN
		IF reset1 = '0' THEN
			PCWrite1 <= '1';
            --state <= NULL;
        ELSIF clock1'EVENT AND clock1 = '0' THEN
            CASE opcode IS  ------ Atribuição dos sinais ao estado atual
                WHEN "0000"	=> -- MOVR
					--state <= OpAddR;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0001"	=> -- MOVI
                    --state <= OpAddI;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0010"	=> -- ADDR
					--state <= OpAddR;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0011" => -- ADDI
					--state <= OpAddI;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0100" => -- SUBR
					--state <= OpSubR;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "11"; -- Subtrai
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0101" => -- SUBI
					--state <= OpSubI;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "11"; -- Substrai
					RegWrite1 <= '1'; -- Sempre ativo

                WHEN "0110" => -- ANDR
					--state <= OpAndR;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "00"; -- AND
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN "0111" => -- ANDI
					--state <= OpAndI;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "00"; -- AND
					RegWrite1 <= '1'; -- Sempre ativo
				
				WHEN "1000" => -- ORR
					--state <= OpOrR;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "01"; -- OR
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN "1001" => -- ORI
					--state <= OpOrI;
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "01"; -- OR
					RegWrite1 <= '1'; -- Sempre ativo
				
                WHEN OTHERS => NULL;
            END CASE;
		--ELSIF clock1'EVENT AND clock1 = '0' THEN
			--CASE state IS
				--WHEN OpAddR => -- Operação de adição tipo R
					

				--WHEN OpAddI => -- Operação de adição tipo I
					

				--WHEN OpSubR => -- Operação de subtração tipo R
					

				--WHEN OpSubI => -- Operação de subtração tipo I
					

				--WHEN OpAndR => -- Operação lógica AND tipo R
					

				--WHEN OpAndI => -- Operação Lógica AND tipo I
					

				--WHEN OpOrR => -- Operação Lógica OR tipo R
					

				--WHEN OpOrI => -- Operação Lógica OR tipo I
					

				--WHEN OTHERS => NULL;
			--END CASE;
		END IF;
	END PROCESS;
END options;
    