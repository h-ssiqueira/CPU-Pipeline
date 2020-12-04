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
TYPE STATE_TYPE IS (OpAddR, OpAddI, OpSubR, OpSubI, OpAndR, OpAndI, OpOrR, OpOrI);
SIGNAL state: STATE_TYPE;
BEGIN
	PROCESS (clock1, reset1, opcode)
    BEGIN
		IF reset1 = '0' THEN
			PCWrite1 <= '1';
            --state <= NULL;
        ELSIF clock1'EVENT AND clock1 = '1' THEN
            CASE opcode IS  ------ Atribuição do estado atual
                WHEN "0000"	=> -- MOVR
                    state <= OpAddR;

                WHEN "0001"	=> -- MOVI
                    state <= OpAddI;

                WHEN "0010"	=> -- ADDR
                    state <= OpAddR;

                WHEN "0011" => -- ADDI
                    state <= OpAddI;

                WHEN "0100" => -- SUBR
                    state <= OpSubR;

                WHEN "0101" => -- SUBI
                    state <= OpSubI;

                WHEN "0111" => -- ANDR
					state <= OpAndR;

				WHEN "1000" => -- ANDI
					state <= OpAndI;
				
				WHEN "1000" => -- ORR
					state <= OpOrR;

				WHEN "1001" => -- ORI
					state <= OpOrI;
				
                WHEN OTHERS => NULL;
            END CASE;
		ELSIF clock1'EVENT AND clock1 = '0' THEN
			CASE state IS
				WHEN OpAddR => -- Operação de adição tipo R
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpAddI => -- Operação de adição tipo I
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "10"; -- Soma
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpSubR => -- Operação de subtração tipo R
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "11"; -- Subtrai
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpSubI => -- Operação de subtração tipo I
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "11"; -- Substrai
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpAndR => -- Operação lógica AND tipo R
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "00"; -- AND
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpAndI => -- Operação Lógica AND tipo I
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "00"; -- AND
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpOrR => -- Operação Lógica OR tipo R
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '1'; -- Utiliza RD
					ALUSrcB1 <= '0'; -- Usa registrador
					ALUOp1 <= "01"; -- OR
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OpOrI => -- Operação Lógica OR tipo I
					PCWrite1 <= '1'; -- PCWrite sempre ativo
					RegDst1 <= '0'; -- Utiliza RT
					ALUSrcB1 <= '1'; -- Usa imediato
					ALUOp1 <= "01"; -- OR
					RegWrite1 <= '1'; -- Sempre ativo

				WHEN OTHERS => NULL;
			END CASE;
		END IF;
	END PROCESS;
END options;
    