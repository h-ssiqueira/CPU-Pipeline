LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY StateMachine IS
    PORT(   clock, reset                                        :IN STD_LOGIC;
            opcode                                              :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PCWrite1, IRWrite1, REGWrite1, ALUSrcA1, RegDst1    :OUT STD_LOGIC;
            MovtoReg1, ALUSrcB1, ALUOp1                         :OUT STD_LOGIC_VECTOR(1 DOWNTO 0)    
    );
            
END StateMachine;

    ARCHITECTURE options OF StateMachine IS
    TYPE STATE_TYPE IS (Fetch, Decode, OpAdd, OpSub, OpAnd, OpOr, WriteBack);
    SIGNAL state: STATE_TYPE;
    --SIGNAL PCWrite, IRWrite, RegDst, ALUScrA, RegWrite : STD_LOGIC;
    --SIGNAL MovtoReg, ALUOp, ALUScrB : STD_LOGIC_VECTOR(1 DOWNTO 0);
	--SIGNAL OPCODE : STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
	PROCESS (clock, reset, opcode)
    BEGIN

        IF reset = '0' THEN
            state <= Fetch;
        ELSIF clock'EVENT AND clock = '1' THEN
            CASE state IS  ------ Atrivuição do próximo estado
                WHEN Fetch	=>
                    --CASE OPCODE IS
                        --WHEN "0000" => state <= Decode;
                        --WHEN "0010" => state <= Decode;
                        --WHEN "0011" => state <= Decode;
                        --WHEN "0100" => state <= Decode; 
                        --WHEN "0001" => state <= Decode; 
                        --WHEN "0101" => state <= Decode;
                        --WHEN "0110" => state <= Decode;
                        --WHEN "0111" => state <= Decode; 
                        --WHEN "1000" => state <= Decode;
                        --WHEN "1001" => state <= Decode;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= Decode;

                WHEN Decode	=>
                    CASE opcode IS
                        WHEN "0000" => state <= WriteBack;
                        WHEN "0001" => state <= WriteBack;
                        WHEN "0010" => state <= OpAdd;
                        WHEN "0011" => state <= OpAdd;
                        WHEN "0100" => state <= OpSub; 
                        WHEN "0101" => state <= OpSub;
                        WHEN "0110" => state <= OpAnd;
                        WHEN "0111" => state <= OpAnd; 
                        WHEN "1000" => state <= OpOr;
                        WHEN "1001" => state <= OpOr;
                        WHEN OTHERS => state <= Fetch;
                    END CASE;

                WHEN OpAdd	=>
                    --CASE OPCODE IS
                        --WHEN "0010" => state <= WriteBack;
                        --WHEN "0011" => state <= WriteBack;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= WriteBack;

                WHEN OpSub	=>
                    --CASE OPCODE IS
                        --WHEN "0100" => state <= WriteBack;
                        --WHEN "0101" => state <= WriteBack;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= WriteBack;

                WHEN OpAnd	=>
                    --CASE OPCODE IS
                        --WHEN "0110" => state <= WriteBack;
                        --WHEN "0111" => state <= WriteBack;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= WriteBack;

                WHEN OpOr	=>
                    --CASE OPCODE IS
                        --WHEN "1000" => state <= WriteBack;
                        --WHEN "1001" => state <= WriteBack;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= WriteBack;

                WHEN WriteBack	=>
                    --CASE OPCODE IS
                        --WHEN "0000" => state <= Fetch;
                        --WHEN "0001" => state <= Fetch;
                        --WHEN "0010" => state <= Fetch;
                        --WHEN "0011" => state <= Fetch;
                        --WHEN "0100" => state <= Fetch; 
                        --WHEN "0101" => state <= Fetch;
                        --WHEN "0110" => state <= Fetch;
                        --WHEN "0111" => state <= Fetch; 
                        --WHEN "1000" => state <= Fetch;
                        --WHEN "1001" => state <= Fetch;
                        --WHEN OTHERS => state <= Fetch;
                    --END CASE;
                    state <= Fetch;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
	END PROCESS;
    -------------------------------------------------------------------------
    --Atribuição dos sinais do estado atual
	 PROCESS(state, opcode,reset)
	 BEGIN
		CASE state IS
			WHEN Fetch => -- operação de Fetch não importa o valor de opcode (independência de tipos)
				PCWrite1 <= '1';
				IRWrite1 <= '1';
				RegDst1 <= '0';
				MovtoReg1 <= "00";
				ALUSrcA1 <= '0';
				ALUSrcB1 <= "01";
				ALUOp1 <= "10";
				RegWrite1 <= '0';
				
			WHEN Decode => -- operação de Decode não importa o valor de opcode (independência de tipos)
				PCWrite1 <= '0';
				IRWrite1 <= '0';
				RegDst1 <= '0';
				MovtoReg1 <= "00";
				ALUSrcA1 <= '0';
				ALUSrcB1 <= "00";
				ALUOp1 <= "00";
				RegWrite1 <= '0';
				
			WHEN OpAdd => -- operação de adição depende dos tipos 
				IF opcode(0) = '1' THEN -- para tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "10";
					ALUOp1 <= "10";
					RegWrite1 <= '0';
				ELSE -- para tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "00";
					ALUOp1 <= "10";
					RegWrite1 <= '0';
				END IF;
				
			WHEN OpSub => -- operação de subtração depende dos tipos 
				IF opcode(0) = '1' THEN -- para tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "10";
					ALUOp1 <= "11";
					RegWrite1 <= '0';
				ELSE -- para tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "00";
					ALUOp1 <= "11";
					RegWrite1 <= '0';
				END IF;
				
			WHEN OpAnd => -- operação de AND depende dos tipos 
				IF opcode(0) = '1' THEN -- para tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "10";
					ALUOp1 <= "00";
					RegWrite1 <= '0';
				ELSE -- para tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "00";
					ALUOp1 <= "00";
					RegWrite1 <= '0';
				END IF;
				
			WHEN OpOr => -- operação de OR depende dos tipos 
				IF opcode(0) = '1' THEN -- para tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "10";
					ALUOp1 <= "01";
					RegWrite1 <= '0';
				ELSE -- para tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					ALUSrcA1 <= '1';
					ALUSrcB1 <= "00";
					ALUOp1 <= "01";
					RegWrite1 <= '0';
				END IF;
			WHEN WriteBack => -- WriteBack depende dos tipos para a escrita no banco de registradores
				IF opcode = "0001" THEN -- para move tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "01";
					--ALUSrcA1 <= '1';
					--ALUSrcB1 <= "10";
					--ALUOp1 <= "00";
					RegWrite1 <= '1';
				ELSIF opcode = "0000" THEN -- para move tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '1';
					MovtoReg1 <= "10";
					--ALUSrcA1 <= '1';
					--ALUSrcB1 <= "00";
					--ALUOp1 <= "00";
					RegWrite1 <= '1';
				ELSIF opcode(0) = '0' THEN -- para operações de ALU tipo R
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '1';
					MovtoReg1 <= "00";
					--ALUSrcA1 <= '1';
					--ALUSrcB1 <= "00";
					--ALUOp1 <= "00";
					RegWrite1 <= '1';
				ELSIF opcode(0) = '1' THEN -- para operações de ALU tipo I
					PCWrite1 <= '0';
					IRWrite1 <= '0';
					RegDst1 <= '0';
					MovtoReg1 <= "00";
					--ALUSrcA1 <= '1';
					--ALUSrcB1 <= "00";
					--ALUOp1 <= "00";
					RegWrite1 <= '1';
				END IF;
			WHEN OTHERS => NULL;
		END CASE;
END PROCESS;
END options;
    